/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model.personal.action;

import com.model.currentIssue.service.CurrentIssueService;
import com.model.executive.dao.ExecutiveDetailsDAO;
import com.model.executive.dto.ExecutiveDetails;
import com.model.executive.service.ExecutiveService;
import com.model.personal.dao.PersonalDetailsDAO;
import com.model.personal.dto.City;
import com.model.personal.service.PersonalService;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author CPEDUR1P5
 */
public class PersonalAction {

    HttpServletRequest request;
    HttpServletResponse response;
    HttpSession httpSession;
    String url;

    public PersonalAction(HttpServletRequest request, HttpServletResponse response) {

        this.request = request;
        this.response = response;
        this.httpSession = request.getSession();
    }

    public String execute(String action,String page) {
        if (action.equalsIgnoreCase("dashBoard")) {
            url = dashBoard();
        } else if (action.equalsIgnoreCase("viewAll")) {
            url = viewAll();
        } else if (action.equalsIgnoreCase("ViewAllGo")) {
            url = viewAllGo();
        } else if (action.equalsIgnoreCase("AddContact")) {
            url = AddContact();
        } else if (action.equalsIgnoreCase("viewDetails")) {
            url = viewDetails();

        } else if (action.equalsIgnoreCase("viewDetailsCS")) {
            url = viewDetailsCS();

        } else if (action.equalsIgnoreCase("updateContactDetails")) {
            url = updateContactDetails();

        } else if (action.equalsIgnoreCase("updateContactDetailsCS")) {
            url = updateContactDetailsCS();

        } else if (action.equalsIgnoreCase("update")) {
            url = updateContact();
        } else if (action.equalsIgnoreCase("expire")) {
            url = expire(page);

        } else if (action.equalsIgnoreCase("viewAllComplementary")) {
            url = viewAllComplementary();

        } else if (action.equalsIgnoreCase("complimentarysubscriber")) {
            url = complimentarysubscriber();

        } else if (action.equalsIgnoreCase("subscribe")) {
            url = subscribe();

        } else if (action.equalsIgnoreCase("updateComplsubscriber")) {
            url = updateComplsubscriber();

        } else if (action.equalsIgnoreCase("print")) {
            url = print(page);

        } else if (action.equalsIgnoreCase("printCompl")) {
            url = printCompl();

        } else if (action.equalsIgnoreCase("printAddress")) {
            url = printAddress();

        }else if (action.equalsIgnoreCase("viewAllconfirmPrintPaid")) {
            url = viewAllconfirmPrintPaid(page);

        }else if (action.equalsIgnoreCase("viewAllconfirmPrintComp")) {
            url = viewAllconfirmPrintComp(page);

        }else if (action.equalsIgnoreCase("viewAllconfirmPrintCredit")) {
            url = viewAllconfirmPrintCredit(page);

        }else if (action.equalsIgnoreCase("confirmPrint")) {
            url = confirmPrint();

        } else if (action.equalsIgnoreCase("printpreview")) {
            url = printpreview();

        } else if (action.equalsIgnoreCase("printpreviewCS")) {
            url = printpreviewCS();

        } else if (action.equalsIgnoreCase("archiveMultiple")) {
            url = archiveMultiple();

        } else if (action.equalsIgnoreCase("viewAllArchive")) {
            url = viewAllArchive();
        } else if (action.equalsIgnoreCase("deleteMultiple")) {
            url = deleteMultiple();
        } else if (action.equalsIgnoreCase("restore")) {
            url = restore();
        } else if (action.equalsIgnoreCase("redirect")) {
            url = redirect();
        } else if (action.equalsIgnoreCase("redirectPrint")) {
            url = redirectPrint();
        } else if (action.equalsIgnoreCase("backup")) {
            url=backup();
        }else if (action.equalsIgnoreCase("addIssue")) {
            url=addIssue();
        }else if (action.equalsIgnoreCase("distList")) {
           url=distList();
        }else if (action.equalsIgnoreCase("searchby")) {
           
           url=searchBy(page);
        }else if (action.equalsIgnoreCase("searchbycredits")) {
           
           url=searchByCreditS(page);
        }else if (action.equalsIgnoreCase("searchforcompls")) {
           
           url=searchForComplS(page);
        }else if (action.equalsIgnoreCase("searchforcomplsstate")) {
           
           url=searchForComplSState(page);
        }else if (action.equalsIgnoreCase("searchforcomplssubscribedby")) {
           
           url=SearchForComplSSubcribedby(page);
        }else if (action.equalsIgnoreCase("searchbydates")) {
           url=searchByDates();
        }else if (action.equalsIgnoreCase("searchbydatescompls")) {
           url=searchByDatesComplS();
        }else if (action.equalsIgnoreCase("searchbydatescredits")) {
           url=searchByDatesCreditS();
        }else if (action.equalsIgnoreCase("AddContactCreditS")) {
            url = AddContactCreditS();
        } else if (action.equalsIgnoreCase("viewAllCreditS")) {
            url = viewAllCreditS();
        } else if (action.equalsIgnoreCase("viewDetailsCreditS")) {
            url = viewDetailsCreditS();

        } else if (action.equalsIgnoreCase("updateContactDetailsCreditS")) {
            url = updateContactDetailsCreditS();

        } else if (action.equalsIgnoreCase("updateCreditS")) {
            url = updateCreditS();

        } else if (action.equalsIgnoreCase("subscribeCredit")) {
            url = subscribeCredit();

        } else if (action.equalsIgnoreCase("printCredit")) {
            url = printCredit();

        } else if (action.equalsIgnoreCase("addSubscriber")) {
            url = addSubscriber();

        }  else if (action.equalsIgnoreCase("addSubscriberComp")) {
            url = addSubscriberComp();

        }else if (action.equalsIgnoreCase("addSubscriberCredit")) {
            url = addSubscriberCredit();

        } else if (action.equalsIgnoreCase("getSubscribers")) {
            url = getSubscribersByName();

        } else if (action.equalsIgnoreCase("expirecomp")) {
            url = expirecomp(page);

        } else if (action.equalsIgnoreCase("markPaid")) {
            url = markPaid();

        } else if (action.equalsIgnoreCase("expirecredit")) {
            url = expirecredit();

        } else if (action.equalsIgnoreCase("expiringAll")) {
            url = expiringAll();

        } else if (action.equalsIgnoreCase("advanceSearch")) {
            url =  advanceSearch();

        }
        return url;
    }

    private String printAddress() {
		return "printaddress.jsp";
	}

	private String advanceSearch() {
    	new PersonalService(request, response).distListView();
    	new ExecutiveService(request, response).viewAllExecutive();
		return "advanceSearch.jsp";
	}

	private String expiringAll() {
        new PersonalService(request, response).viewExpiringAll();
        return "viewExpiringAll.jsp";
    }

	private String expirecredit() {
        new PersonalService(request, response).viewAllExpiryCredit();
        return "viewAllExpiredCredit.jsp";
    }

	private String addSubscriberCredit() {
       if (new PersonalService(request, response).addSubscriber()) {
            return "addsubscribercredit.jsp";
        } else {
            return "viewAllCreditS.jsp";
        }
    }

	private String markPaid() {
    	
    	if(new PersonalService(request, response).markPaid()) {
    		return "paidsuccess.jsp";
    	}
    	return "paymentfailure.jsp";
    	
	}

	private String expirecomp(String page) {
        new PersonalService(request, response).viewAllExpiryComp(page);
        return "viewAllExpiredComp.jsp";
    }

	private String addSubscriberComp() {
       if (new PersonalService(request, response).addSubscriber()) {
            return "addsubscribercomp.jsp";
        } else {
            return "viewAllCS.jsp";
        }
    }

	private String getSubscribersByName() {
        new PersonalService(request, response).getSubscribersByName();
        return "searchedsubscribers.jsp";
    }

	private String viewAll() {
        new PersonalService(request, response).viewAllPersonal();
        System.out.println("IN action's view all");
        return "viewAll.jsp";
    }

    private String AddContact() {
        if (new PersonalService(request, response).addContact()) {
            return "saved.jsp";
        } else {
            return "notSaved.jsp";
        }
    }

    private String viewDetails() {
        if (new PersonalService(request, response).viewDetailsOfContact()) {
            //return "patientDetails_1.jsp";
            return "subscriber_details.jsp";
        } else {
            return "viewAll_1.jsp";
        }
    }

    private String updateContactDetails() {
    	
    	List<ExecutiveDetails> listExecutive = new ExecutiveDetailsDAO().readListOfObjects();
	        if(listExecutive!=null){
	            httpSession.setAttribute("ExecutiveList", listExecutive);
	        }
        
        List<City> listCity = new PersonalDetailsDAO().readListOfCity();
	        if(listCity!=null){
	            httpSession.setAttribute("CityList", listCity);
	        }
        
        if (new PersonalService(request, response).viewDetailsOfContact()) {
            String userType = "admin";
            if (userType.equalsIgnoreCase("admin")) {
                return "updatesubscriber.jsp";
            } else {
                return "updatememberexecutive.jsp";
            }

        } else {
            return "viewAll.jsp";
        }
    }

    private String updateContact() {
    	List<ExecutiveDetails> listExecutive = new ExecutiveDetailsDAO().readListOfObjects();
        if(listExecutive!=null){
            httpSession.setAttribute("ExecutiveList", listExecutive);
        }
    
    List<City> listCity = new PersonalDetailsDAO().readListOfCity();
        if(listCity!=null){
            httpSession.setAttribute("CityList", listCity);
        }
        return "Controller?process=PersonalProcess&action=viewDetails&id=" + new PersonalService(request, response).updateContactInformation();
    }

    private String expire(String page) {
        new PersonalService(request, response).viewAllExpiry(page);
        System.out.println("IN action's viewAllExpiry");
        return "viewAllExpired.jsp";
    }

    private String complimentarysubscriber() {
        if (new PersonalService(request, response).addcomplimentarysubscriber()) {
            return "savedCompl.jsp";
        } else {
            return "notSaved.jsp";
        }
    }

    private String viewAllComplementary() {
        new PersonalService(request, response).viewAllCompementary();
        System.out.println("IN action's view all");
        return "viewAllCS.jsp";
    }

    private String print(String page) {
        new PersonalService(request, response).viewAllPrint(page);
        return "printAll.jsp";
    }

    private String printpreview() {
        if (new PersonalService(request, response).printMultiple()) {
            return "printpreview.jsp";
        } else {
            return "printAll.jsp";
        }

    }

    private String archiveMultiple() {
        String hiddenValue = request.getParameter("hiddenChest");
        System.out.println("The Hidden value is "+hiddenValue);
        boolean result = new PersonalService(request, response).archiveMultiple();
        
        if(result) {
        		return "archivesuccess.jsp";
        	}else {
        		return "archivefailure.jsp";	
        	}
       /* if(hiddenValue.equals("complsubscriber")){
            return "Controller?process=PersonalProcess&action=viewAllComplementary";
        }else if(hiddenValue.equals("creditsubscriber")){
            return "Controller?process=PersonalProcess&action=viewAllCreditS";
        } else{
             return "Controller?process=PersonalProcess&action=viewAll";
        }*/
    }

    private String viewAllArchive() {
        new PersonalService(request, response).viewAllArchive();
        System.out.println("IN action's view all");
        return "viewAllArchive.jsp";
    }

    private String deleteMultiple() {
        new PersonalService(request, response).deleteMultiple();
        return "Controller?process=PersonalProcess&action=viewAllArchive";
    }

    private String restore() {
        new PersonalService(request, response).restoreMultiple();
        return "Controller?process=PersonalProcess&action=viewAllArchive";
    }

    private String viewDetailsCS() {
        if (new PersonalService(request, response).viewDetailsOfContact()) {
            //return "patientDetails_1.jsp";
            return "subscriber_details_cs.jsp";
        } else {
            return "viewAll.jsp";
        }
    }

    private String updateContactDetailsCS() {

    	
    	List<ExecutiveDetails> listExecutive = new ExecutiveDetailsDAO().readListOfObjects();
	        if(listExecutive!=null){
	            httpSession.setAttribute("ExecutiveList", listExecutive);
	        }
        List<City> listCity = new PersonalDetailsDAO().readListOfCity();
	        if(listCity!=null){
	            httpSession.setAttribute("CityList", listCity);
	        }
    		
    	if (new PersonalService(request, response).viewDetailsOfContact()) {
            String userType = "admin";
            if (userType.equalsIgnoreCase("admin")) {
                return "updatesubscribercomplimentary.jsp";
            } else {
                return "updatesubscribercomplimentary.jsp";
            }

        } else {
            return "viewAll.jsp";
        }
    	
    }

    private String updateComplsubscriber() {
        return "Controller?process=PersonalProcess&action=viewDetailsCS&id=" + new PersonalService(request, response).updateComplsubscriberContactInformation();
    }

    private String viewAllGo() {
        return "viewAll.jsp";
    }

    private String redirect() {
        return "Search.jsp";
    }

    private String redirectPrint() {
        return "printSearch.jsp";
    }

    private String subscribe() {
        return "Controller?process=PersonalProcess&action=viewDetailsCS&id=" + new PersonalService(request, response).subscribe();
    }

    private String printCompl() {

        new PersonalService(request, response).viewAllPrintCS();
        System.out.println("IN action's view all");
        return "printAllCS.jsp";

    }

    private String printpreviewCS() {
        if (new PersonalService(request, response).printMultiple()) {
            return "printpreviewCS.jsp";
        } else {
            return "printAllCS.jsp";
        }
    }

    private String backup() {
       
        String fileName = request.getParameter("filename");
       if(new PersonalService(request, response).backupData(fileName)){ 
    	   	return"BackupSuccess.jsp";
       }else{
           	return"BackupFailed.jsp";
       }
    }

    private String confirmPrint() {
       if(new PersonalService(request, response).confirmPrintDelete()){ 
        return"confirmPrint.jsp";
       }else{
           return"failConfirmPrint.jsp";
       }
    }

    private String viewAllconfirmPrintPaid(String page) {
        new PersonalService(request, response).viewAllPersonalconfirmPrintPaid(page);
        return "printUpdate.jsp";
    }
    
    private String viewAllconfirmPrintComp(String page) {
        new PersonalService(request, response).viewAllPersonalconfirmPrintComp(page);
        return "printUpdatecomp.jsp";
    }
    
    private String viewAllconfirmPrintCredit(String page) {
        new PersonalService(request, response).viewAllPersonalconfirmPrintCredit(page);
        return "printUpdatecredit.jsp";
    }

    public String executeNextLink(String action, String first) {
        if (action.equalsIgnoreCase("viewAll")) {
            System.out.println("Action is ViewAll");
            url = viewAllNextLink(first);
        }
        return url;
    }

     private String viewAllNextLink(String first) {
       new PersonalService(request, response).viewAllPersonalNextLink(first);
        System.out.println("IN action's view all");
        return "printUpdate.jsp";
    }

    public String executePages(String page) {
        new PersonalService(request, response).viewAllPersonalPage(page);
       
        return "viewAll.jsp";
    }

    private String dashBoard() {
         new PersonalService(request, response).dashBoard();
        System.out.println("IN action's view all");
        return "dashBoard.jsp";
    }

    private String addIssue() {
        new CurrentIssueService(request, response).add();
        System.out.println("IN action's CurrentIssueService");
        return "currentIssueSuccess.jsp";
    }
    
    private String distList() {
        new PersonalService(request, response).distListView();
        //return "addContact.jsp";
        return "addsubscriber.jsp";
    }

    private String searchBy(String criteria) {
        new PersonalService(request, response).searchBy(criteria);
        return "printAllSearch.jsp";
    }

    private String searchByDates() {
        new PersonalService(request, response).searchByDates();
        return "printAllSearch.jsp";
    }

    private String AddContactCreditS() {
         if (new PersonalService(request, response).addContactCreditS()) {
            return "saved_Credit.jsp";
        } else {
            return "notSaved.jsp";
        }
    }

    private String viewAllCreditS() {
        new PersonalService(request, response).viewAllCreditS();
        return "viewAllCreditS.jsp";
    }

    private String viewDetailsCreditS() {
         if (new PersonalService(request, response).viewDetailsOfContact()) {
            //return "patientDetails_1.jsp";
            return "subscriber_details_credit.jsp";
        } else {
            return "viewAllCreditS.jsp";
        }
    }

    private String updateContactDetailsCreditS() {
    	
    	List<ExecutiveDetails> listExecutive = new ExecutiveDetailsDAO().readListOfObjects();
        if(listExecutive!=null){
            httpSession.setAttribute("ExecutiveList", listExecutive);
        }
    
        List<City> listCity = new PersonalDetailsDAO().readListOfCity();
        if(listCity!=null){
            httpSession.setAttribute("CityList", listCity);
        }
        
        if (new PersonalService(request, response).viewDetailsOfContact()) {
            String userType = "admin";
            if (userType.equalsIgnoreCase("admin")) {
                return "updatesubscribercredit.jsp";
            } else {
                return "updatesubscribercredit.jsp";
            }

        } else {
            return "viewAllCreditS.jsp";
        }
    }

    private String updateCreditS() {
        return "Controller?process=PersonalProcess&action=viewDetailsCreditS&id=" + new PersonalService(request, response).updateCreditsubscriberContactInformation();
    }

    private String subscribeCredit() {
        return "Controller?process=PersonalProcess&action=viewDetailsCreditS&id=" + new PersonalService(request, response).subscribeCredit();
    }

    private String printCredit() {
         new PersonalService(request, response).viewAllPrintCreditS();
         return "printAllCreditS.jsp";
    }

    private String searchForComplS(String criteria) {
       
        new PersonalService(request, response).searchForComplS(criteria);
        return "advancesearchcompsubscriber.jsp";
    
    }

    private String searchByDatesComplS() {
        new PersonalService(request, response).searchByDatesComplS();
        return "advancesearchcompsubscriber.jsp";
    }

    private String searchForComplSState(String criteria) {
        new PersonalService(request, response).searchForComplSState(criteria);
        return "advancesearchcompsubscriber.jsp";
    }

    private String SearchForComplSSubcribedby(String criteria) {
        new PersonalService(request, response).searchForComplSSubcribedby(criteria);
        return "advancesearchcompsubscriber.jsp";
    }

    private String searchByCreditS(String criteria) {
        new PersonalService(request, response).searchByCreditS(criteria);
        return "advancesearchcreditsubscriber.jsp";
    }

    private String searchByDatesCreditS() {
        new PersonalService(request, response).searchByDatesCreditS();
        return "advancesearchcreditsubscriber.jsp";
    }

    private String addSubscriber() {
       if (new PersonalService(request, response).addSubscriber()) {
            return "addsubscriber.jsp";
        } else {
            return "viewAll.jsp";
        }
    }

    
    
}
