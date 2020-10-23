package com.sspl.master.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sspl.entity.ContractTypeEntity;
import com.sspl.master.service.ContractMngmtService;

@Controller
public class FileDownloadController {

	@Autowired
	ContractMngmtService contractService;
	
	//{fileName:.+}
	@RequestMapping("/download/{type}/{profileId}")
	public void downloadPDFResource(HttpServletRequest request, HttpServletResponse response,
			@PathVariable("type") String type,
			@PathVariable("filename") Integer profileId) {
	
		Map<String,Object> map = contractService.editContractType(profileId);
		List<ContractTypeEntity> editContractTypeList=(List<ContractTypeEntity>) map.get("editContractTypeList");
		String fileName ="", folder = "";
		if(editContractTypeList.size()>0) {
			fileName = editContractTypeList.get(0).getUploadedContractDocument();
			
			if(type.equals("u")) {
				folder = editContractTypeList.get(0).getUploadedContractPath();
			} else {
				folder = editContractTypeList.get(0).getSignedContractPath();
			}
		}
		
		
		System.out.printf("filename = %s, type=%s",fileName,type);
		
		
		
		//String fileExt = fileName.substring(fileName.lastIndexOf(".")).toUpperCase();
		//System.out.println(fileExt);
		String contentType = "APPLICATION/OCTET-STREAM";
		fileName = "16102020161157_TC2005281085742746.pdf";
		
		
		Path path = Paths.get(folder, fileName);
		if (Files.exists(path)) {
			response.setContentType(contentType);
			try {
				response.setHeader("Content-Length", String.valueOf(Files.size(path)));
			} catch (IOException e) {
				e.printStackTrace();
			}
			//response.addHeader("Content-Disposition", "attachment; filename=" + fileName);
			response.addHeader("Content-Disposition", "inline; filename=" + fileName);
			try {
				Files.copy(path, response.getOutputStream());
				response.getOutputStream().flush();
			} catch (IOException ex) {
				ex.printStackTrace();
			}
		}
	}
	
	/*@RequestMapping(value = "/download", method = RequestMethod.GET, produces = "application/pdf")
	public @ResponseBody HttpEntity<byte[]> downloadB() throws IOException {
	    File file = new File("/home/malaya/Desktop/Contract Content/StampPaper.pdf");
	    byte[] document = FileCopyUtils.copyToByteArray(file);
	    HttpHeaders header = new HttpHeaders();
	    header.setContentType(new MediaType("application", "pdf"));
	    header.set("Content-Disposition", "attachment; filename=" + file.getName());
	    header.setContentLength(document.length);
	    return new HttpEntity<byte[]>(document, header);
	}*/
	
	/*@RequestMapping(value = "/download", method = RequestMethod.GET, produces = "application/pdf")
	public @ResponseBody void downloadA(HttpServletResponse response) throws IOException {
	    File file = new File("/home/malaya/Desktop/Contract Content/StampPaper.pdf");
	    InputStream in = new FileInputStream(file);
	    response.setContentType("application/pdf");
	    response.setHeader("Content-Disposition", "attachment; filename=" + file.getName());
	    response.setHeader("Content-Length", String.valueOf(file.length()));
	    FileCopyUtils.copy(in, response.getOutputStream());
	    response.flushBuffer();
	}*/
	
   /* @RequestMapping("/download")
    public void downloader(HttpServletRequest request, HttpServletResponse response) {
        String fileName="stamp.pdf";
    	try {
            
            File file = new File("/home/malaya/Desktop/Contract Content/StampPaper.pdf");
 
            if (file.exists()) {
                String mimeType = "application/pdf";
 
                if (mimeType == null) {
                    mimeType = "application/octet-stream";
                }
 
                response.setContentType(mimeType);
                response.addHeader("Content-Disposition", "attachment; filename=" + fileName);
                response.setContentLength((int) file.length());
 
                OutputStream os = response.getOutputStream();
                FileInputStream fis = new FileInputStream(file);
                byte[] buffer = new byte[4096];
                int b = -1;
 
                while ((b = fis.read(buffer)) != -1) {
                    os.write(buffer, 0, b);
                }
                System.out.println("Requested " + fileName + " file found!!");
                fis.close();
                os.close();
            } else {
                System.out.println("Requested " + fileName + " file not found!!");
            }
        } catch (IOException e) {
            System.out.println("Error:- " + e.getMessage());
            e.printStackTrace();
        }
    }*/
}