abstract class BaseStateHandler
{
    void showError(int iStatusCode, String sMessage);
    void handleResponse(int iActionId, Object responseObject);
    void showProgressbar();
    void hideProgressbar();
    void initModel();

}