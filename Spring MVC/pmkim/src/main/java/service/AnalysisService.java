package service;

import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.stereotype.Service;

@Service
public class AnalysisService {
	public byte[] returnRImg2() {
		RConnection r = null;
		byte retImg [] = null;
		try {
			r = new RConnection();		
			r.eval("library(DBI)");
			r.eval("setwd('c:/SEHO/Rstudy')");
			r.eval("result <- read.table('data/product_click.log')");
			r.eval("names(result) <- c('CLICK_TIME', 'PID')");
			r.eval("data_p <- table(result$PID)");
			r.eval("data_t <- table(substr(result$CLICK_TIME,9,10)) ");
			r.eval("png('test2.png')");
			r.eval("par(mfrow=c(1,2))");
			r.eval("pie(data_p, radius = 1, col=rainbow(10))");
			r.eval("barplot(data_t, col=terrain.colors(10))");
			r.eval("dev.off()");
			r.eval("r=readBin('test2.png','raw',1020*1020)");
			r.eval("unlink('test2.png')");
			retImg = r.eval("r").asBytes();
		} catch(Exception e) {
			System.out.println(e);	
			e.printStackTrace();
		} finally {
			r.close();
		}
		return retImg; 
	}
	
	public String returnPlotly() {
		RConnection r = null;
		String retStr = "";
		try {		
			r = new RConnection();		
			r.eval("library(plotly)");		
			r.eval("library(ggplot2)");
			r.eval("library(htmltools)");		
			r.eval("p <- ggplot(data = mpg, aes(x = displ, y = hwy, col = drv)) + geom_point()");
			r.eval("my_plotly <- ggplotly(p)");
			r.eval("my_path <- renderTags(my_plotly)");
			retStr = r.eval("my_path$html").asString();
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		} finally {
			r.close();
		}
		System.out.println(retStr);
		return retStr;
	}
	public String returnWC2_1() {
		RConnection r = null;
		String retStr = "";
		try {
			r = new RConnection();
			r.eval("library(wordcloud2)");		
			r.eval("library(htmltools)");			
			r.eval("my_cloud <- wordcloud2(demoFreq, size = 0.5, color = 'random-light', )");
			r.eval("my_path <- renderTags(my_cloud)");
			retStr = r.eval("my_path$html").asString();
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		} finally {
			r.close();
		}
		System.out.println(retStr);
		return retStr;
	}
	public String returnWC2_2() {
		RConnection r = null;
		String retStr = "";
		try {
			r = new RConnection();
			r.eval("source('c:/SEHO/Rstudy/wordcloud2.R',encoding='UTF-8')");
			retStr = r.eval("my_path$html").asString();
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		} finally {
			r.close();
		}
		System.out.println(retStr);
		return retStr;
	}
}
