/// <h1>Follow this convention for naming the class and view model class prefix and View suffix</h1>
 /// use to abstract method for common logic for
 abstract class IBaseView
 {
   void showError(int iStatusCode, String sMessage);
   void handleResponse(Object responseObject);
   void showProgressbar();
   void hideProgressbar();
 }
 ///used in <a href="photo_viewmodel.dart">PhotoViewModel.class</a>
 abstract class IPhotoView extends IBaseView{
   void  onFetchPhotoList();
   void  onLoadImageData();

 }