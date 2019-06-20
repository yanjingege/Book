package com.oracle.web.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.util.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oracle.web.bean.PageBean;
import com.oracle.web.bean.User;
import com.oracle.web.service.UserService;
import com.oracle.web.test.DownUtils;

@Controller
@Scope(value = "prototype")
public class UserHandler {

	@Autowired
	private UserService userService;

	// 1.添加用户
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String add(User user) {

		System.out.println(user);

		userService.save(user);

		return "redirect:/users/1";

	}

	// 2.删除用户
	@RequestMapping(value = "/user/{id}", method = RequestMethod.DELETE)
	public String delete(@PathVariable("id") String ids) {

		String[] arr = ids.split(",");

		userService.delete(arr);

		return "redirect:/users/1";

	}

	// 3.查看用户
	@RequestMapping(value = "/users/{pageNow}", method = RequestMethod.GET)
	public String list(@PathVariable("pageNow") Integer pageNow, HttpServletRequest request) {

		PageBean<User> pb = userService.selectAllPage(pageNow);

		// System.out.println(pb);

		request.setAttribute("pb", pb);

		return "showUser";

	}

	// 4.单查用户
	@RequestMapping(value = "/user/{id}", method = RequestMethod.GET)
	public String updateUI(@PathVariable("id") Integer id, HttpSession session) {

		User user = userService.queryOneUser(id);

		session.setAttribute("u", user);

		return "updateUser";

	}

	// 5.修改用户
	@RequestMapping(value = "/user", method = RequestMethod.PUT)
	public String update(User user) {

		userService.update(user);

		System.out.println(user);

		return "redirect:/users/1";

	}

	// 导出选择
	@RequestMapping(value = "/outSelect1/{ids}", method = RequestMethod.GET)
	public void outSelect(@PathVariable("ids") String ids, HttpServletRequest req, HttpServletResponse resp)
			throws IOException {

		String[] arr = ids.split(",");

		List<User> list = userService.queryUsers(arr);

		String key = "选择";

		// 1.创建一个工作簿
		HSSFWorkbook workbook = new HSSFWorkbook();

		// 2.创建一个工作表
		HSSFSheet sheet = workbook.createSheet("用户信息表");

		// 设置单元格的宽度
		sheet.setColumnWidth(4, 15 * 256);

		// 创建一个样式对象
		HSSFCellStyle style = workbook.createCellStyle();

		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 居中

		HSSFFont font = workbook.createFont();// 设置字体样式

		font.setBold(true);

		font.setColor(HSSFColor.BLUE.index);

		style.setFont(font);

		// 3.创建行
		String[] title = { "编号", "姓名", "用户名", "密码", "手机", "时间" };

		HSSFRow row = sheet.createRow(0);

		for (int i = 0; i < title.length; i++) {

			HSSFCell cell = row.createCell(i);

			cell.setCellStyle(style);

			cell.setCellValue(title[i]);

		}

		// 4.把list里面的数据放进去

		// List<Fenlei> list =
		// FenleiServiceFactory.getFenleiServiceImpl().showFenlei();

		// 再创建一个样式对象
		HSSFCellStyle style2 = workbook.createCellStyle();

		style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);

		// 要几行？

		// 要几行？
		for (int i = 0; i < list.size(); i++) {// 循环几次创建几行

			HSSFRow row2 = sheet.createRow(i + 1);// 从第二行开始 1 2 3 4 5

			User user = list.get(i);

			HSSFCell cell1 = row2.createCell(0);

			cell1.setCellStyle(style2);

			cell1.setCellValue(user.getId());

			HSSFCell cell2 = row2.createCell(1);

			cell2.setCellStyle(style2);

			cell2.setCellValue(user.getName());

			HSSFCell cell3 = row2.createCell(2);

			cell3.setCellValue(user.getUsername());

			cell3.setCellStyle(style2);

			HSSFCell cell4 = row2.createCell(3);
			cell4.setCellStyle(style2);

			cell4.setCellValue(user.getPassword());

			HSSFCell cell5 = row2.createCell(4);
			cell5.setCellStyle(style2);

			cell5.setCellValue(user.getPhone());

			HSSFCell cell6 = row2.createCell(5);
			cell6.setCellStyle(style2);

			cell6.setCellValue(user.getTime());

		}

		// 内存，把数据输出到硬盘
		File f = new File("用户信息表.xls");

		OutputStream outputStream = new FileOutputStream(f);

		workbook.write(outputStream);// 把工作簿的内容输出到person.xls里面

		// 相应该浏览器
		String file = f.getName();

		// System.out.println(file);

		String mime = req.getSession().getServletContext().getMimeType(file);

		String fileName = DownUtils.filenameEncoding(key + f.getName(), req);

		String disposition = "attachment;filename=" + fileName;

		// 设置两个响应头信息即可 (两个头)，告诉浏览器，我这个东西是下载的

		resp.setHeader("Content-Type", mime);

		resp.setHeader("Content-DisPosition", disposition);

		// 一个流 （两个流）

		// 把文件加载到内存

		InputStream inputStream = new FileInputStream(file);

		// 把流输出给浏览器

		ServletOutputStream out = resp.getOutputStream();

		// 复制

		IOUtils.copy(inputStream, out);

	}
	
	//导出全部
	
		@RequestMapping(value = "/outAll1", method = RequestMethod.GET)
		public String outAll(HttpServletRequest req, HttpServletResponse resp) throws IOException {

			List<User> list = userService.list2();

			String key = "全部";

			// 1.创建一个工作簿
			HSSFWorkbook workbook = new HSSFWorkbook();

			// 2.创建一个工作表
			HSSFSheet sheet = workbook.createSheet("用户信息表");

			// 设置单元格的宽度
			sheet.setColumnWidth(4, 15 * 256);

			// 创建一个样式对象
			HSSFCellStyle style = workbook.createCellStyle();

			style.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 居中

			HSSFFont font = workbook.createFont();// 设置字体样式

			font.setBold(true);

			font.setColor(HSSFColor.BLUE.index);

			style.setFont(font);

			// 3.创建行
			String[] title = { "编号", "姓名", "用户名", "密码", "手机", "时间" };

			HSSFRow row = sheet.createRow(0);

			for (int i = 0; i < title.length; i++) {

				HSSFCell cell = row.createCell(i);

				cell.setCellStyle(style);

				cell.setCellValue(title[i]);

			}
			

			// 4.把list里面的数据放进去

			// List<Fenlei> list =
			// FenleiServiceFactory.getFenleiServiceImpl().showFenlei();

			// 再创建一个样式对象
			HSSFCellStyle style2 = workbook.createCellStyle();

			style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);

			// 要几行？

			// 要几行？
			for (int i = 0; i < list.size(); i++) {// 循环几次创建几行

				HSSFRow row2 = sheet.createRow(i + 1);// 从第二行开始 1 2 3 4 5

				User user = list.get(i);

				HSSFCell cell1 = row2.createCell(0);

				cell1.setCellStyle(style2);

				cell1.setCellValue(user.getId());

				HSSFCell cell2 = row2.createCell(1);

				cell2.setCellStyle(style2);

				cell2.setCellValue(user.getName());

				HSSFCell cell3 = row2.createCell(2);

				cell3.setCellValue(user.getUsername());

				cell3.setCellStyle(style2);

				HSSFCell cell4 = row2.createCell(3);
				cell4.setCellStyle(style2);

				cell4.setCellValue(user.getPassword());

				HSSFCell cell5 = row2.createCell(4);
				cell5.setCellStyle(style2);

				cell5.setCellValue(user.getPhone());

				HSSFCell cell6 = row2.createCell(5);
				cell6.setCellStyle(style2);

				cell6.setCellValue(user.getTime());

			}
			
			// 内存，把数据输出到硬盘
			File f = new File("用户信息表.xls");

			OutputStream outputStream = new FileOutputStream(f);

			workbook.write(outputStream);// 把工作簿的内容输出到person.xls里面

			// 相应该浏览器
			String file = f.getName();

			// System.out.println(file);

			String mime = req.getSession().getServletContext().getMimeType(file);

			String fileName = DownUtils.filenameEncoding(key + f.getName(), req);

			String disposition = "attachment;filename=" + fileName;

			// 设置两个响应头信息即可 (两个头)，告诉浏览器，我这个东西是下载的

			resp.setHeader("Content-Type", mime);

			resp.setHeader("Content-DisPosition", disposition);

			// 一个流 （两个流）

			// 把文件加载到内存

			InputStream inputStream = new FileInputStream(file);

			// 把流输出给浏览器

			ServletOutputStream out = resp.getOutputStream();

			// 复制

			IOUtils.copy(inputStream, out);
			
			return null;

		}

}

