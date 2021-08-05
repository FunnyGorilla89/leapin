package MVC;

import Action.Account_delete_Action;
import Action.Action;
import Action.Board_Action;
import Action.Board_Detail_Action;
import Action.Board_list_on_top_Action;
import Action.Deal_List_page_Action;
import Action.Deal_list_offer_Action;
import Action.Deal_list_request_Action;
import Action.Disagree_delete_receive_request_Action;
import Action.Enterprise_Count_Action;
import Action.Enterprise_FindAction;
import Action.Enterprise_Find_Show_Action;
import Action.Enterprise_InformationAction;
import Action.Enterprise_Select_Action;
import Action.Enterprise_info_editForm_Action;
import Action.Enterprise_info_edit_Action;
import Action.Enterprise_transForm_Action;
import Action.Enterprise_trans_Action;
import Action.Get_category_Action;
import Action.Get_enterprise_info_Action;
import Action.Get_member_info_Action;
import Action.Get_request_info_Action;
import Action.Id_chk_Action;
import Action.LoginFormAction;
import Action.Login_Action;
import Action.LogoutAction;
import Action.MainAction;
import Action.Main_Category_Action;
import Action.Main_Enterprise_Action;
import Action.Member_change_Action;
import Action.Member_info_edit_Action;
import Action.Member_info_edit_page_Action;
import Action.Mypage_Action;
import Action.PwcheckForm_Action;
import Action.Pwcheck_Action;
import Action.Receive_offer_list_on_top_Action;
import Action.Receive_offer_on_top_Action;
import Action.Receive_request_list_on_top_Action;
import Action.ReceivedOffer_Action;
import Action.ReceivedOfferlist_Action;
import Action.Review_Action;
import Action.Send_offer_complete_Action;
import Action.Sign_up_Action;
import Action.SignupFormAction;
import Action.WriteBoard_Action;
import Action.WriteBoard_Form_Action;
import Action.WriteRequest_Action;
import Action.WriteRequest_Form_Action;
import Action.Write_offerForm_Action;
import Action.Write_offer_Action;
import Action.chat_log_Action;
import Action.chat_log_page_Action;
import Action.chat_main_Action;
import Action.chat_main__page_Action;
import Action.create_board_Action;

public class ActionFactory {
	private static final ActionFactory instance = new ActionFactory();
	private ActionFactory(){}
	static ActionFactory getInstance() {
		return instance;
	}
	
	Action getAction(String command) {
		Action action = null;
		switch(command) {
		case "main":
			action = new MainAction();
			break;
		case "Main":
			action = new MainAction();
			break;
		case "enterpriseInformation" :
			action = new Enterprise_InformationAction();
			break;
		case "main_category" :
			action = new Main_Category_Action();
			break;
		case "enterprise" :
			action = new Main_Enterprise_Action();
			break;
		case "Get_category" :
			action = new Get_category_Action();
			break;
		case "Get_request_info" :
			action = new Get_request_info_Action();
			break;
		case "enterprise_select" :
			action = new Enterprise_Select_Action();
			break;
		case "enterprise_find" :
			action = new Enterprise_FindAction();
			break;
		case "enterprise_find_show" :
			action = new Enterprise_Find_Show_Action();
			break;
		case "enterprise_count" :
			action = new Enterprise_Count_Action();
			break;
		case "Enterprise_trans" :
			action = new Enterprise_trans_Action();
			break;
		case "Enterprise_transForm" :
			action = new Enterprise_transForm_Action();
			break;
		case "Enterprise_info_editForm" :
			action = new Enterprise_info_editForm_Action();
			break;
		case "Enterprise_info_edit" :
			action = new Enterprise_info_edit_Action();
			break;
		case "review" :
			action = new Review_Action();
			break;
		case "Login" :   // login action (=form 다음 처리)
			action = new Login_Action();
			break;
		case "LoginForm" :
			action = new LoginFormAction();
			break;
		case "id_chk" : 
			action = new Id_chk_Action();
			break;
		case "Logout" : 
			action = new LogoutAction();
			break;
		case "Sign_up" :
			action = new Sign_up_Action();
			break;
		case "Pwcheck":
			action = new Pwcheck_Action();
			break;
		case "PwcheckForm":
			action = new PwcheckForm_Action();
			break;
		case "SignupForm" :
			action = new SignupFormAction();
			break;
		case "Send_offer_complete" :
			action = new Send_offer_complete_Action();
			break;
		case "Member_info_edit":
			action = new Member_info_edit_Action();
			break;
		case "Member_info_edit_page":
			action = new Member_info_edit_page_Action();
			break;
		case "Mypage":
			action = new Mypage_Action();
			break;
		case "Member_change":
			action = new Member_change_Action();
			break;
		case "Account_delete":
			action = new Account_delete_Action();
			break;
		case "Receive_request_list_on_top":
			action = new Receive_request_list_on_top_Action();
			break;
		case "Disagree_delete_receive_request":
			action = new Disagree_delete_receive_request_Action();
			break;
		case "chat_main_page" :
			action = new chat_main__page_Action();
			break;
		case "chat_main" :
			action = new chat_main_Action();
			break;
		case "chat_log_page" :
			action = new chat_log_page_Action();
			break;
		case "chat_log" :
			action = new chat_log_Action();
			break;
		case "Write_offer" :
			action = new Write_offer_Action();
			break;
		case "Write_offerForm" :
			action = new Write_offerForm_Action();
			break;
		case "Deal_list_request" :
			action = new Deal_list_request_Action();
			break;
		case "Deal_list_offer" :
			action = new Deal_list_offer_Action();
			break;
		case "Get_enterprise_info":
			action = new Get_enterprise_info_Action();
			break;
		case "Get_member_info":
			action = new Get_member_info_Action();
			break;
		case "Receive_offer_on_top":
			action = new Receive_offer_on_top_Action();
			break;
		case "Receive_offer_list_on_top" :
			action = new Receive_offer_list_on_top_Action();
			break;
		case "receivedoffer" :
			action = new ReceivedOffer_Action();
			break;
		case "receivedofferlist" :
			action = new ReceivedOfferlist_Action();
			break;
		case "writeRequest_Form" : 
			action = new WriteRequest_Form_Action();
			break;
		case "writeRequest" :
			action = new WriteRequest_Action();
			break;
		case "Board_list_on_top" :
			action = new Board_list_on_top_Action();
			break;
		case "board" :
			action = new Board_Action();
			break;
		case "creat_board":
			action = new create_board_Action();
			break;
		case "Board_Detail" :
			action = new Board_Detail_Action();
			break;
		case "WriteBoard_Form" : 
			action = new WriteBoard_Form_Action();
			break;
		case "WriteBoard" :
			action = new WriteBoard_Action();
			break;
		case "Deal_List_page":
			action = new Deal_List_page_Action();
			break;
		
		}
		
		
		return action;
	}
} 