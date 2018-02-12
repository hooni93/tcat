package spring.project.tcat.controller;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import spring.project.tcat.VO.MemberVO;
import spring.project.tcat.service.MoGuestService;
@Controller
public class AndroidController {
       private Logger log=Logger.getLogger(this.getClass());
       @Autowired
       MoGuestService MGService;
       
       @ResponseBody
       @RequestMapping("tcatLoginAn")
       public Map<String,String> tcatLoginAn(HttpServletRequest req,Model model) {
             log.info("tcatLoginAn()");
             System.out.println("tcatLoginAn()");
             int cnt=MGService.androidIdCheck(req, model);
             String id=(String)req.getAttribute("id");
             Map<String,String> out=new HashMap<String,String>();
             if(cnt!=0) {
                    out.put("member_id", id);
             }else {
                    out.put("member_id", null);
             }
             return out;
       }
       
       @ResponseBody
       @RequestMapping("tcatMyPageMainAn")
       public Map<String,Object> tcatMyPageMainAn(HttpServletRequest req,Model model){
             log.info("tcatMyPageMainAn()");
           
             MGService.androidVOresult(req, model);
             
             MemberVO vo=(MemberVO)req.getAttribute("vo");
             Map<String,Object> map=new HashMap<String,Object>();
             map.put("data1", vo.getMember_name());
             map.put("data2", 0);
             map.put("data3", 0);
             map.put("data4", 0);
             map.put("member", vo);
             
             return map;
       }
       
       
}
