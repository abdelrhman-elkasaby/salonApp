part of 'change_password_imports.dart';
class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> with ChangePasswordData {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          iconSize: 30,
          color: Colors.purple[800],
          icon: Icon(Icons.arrow_back),
          onPressed:()=> Navigator.of(context).pushReplacementNamed(AccountInformation.routeName),
        ),
        backgroundColor: Colors.amber,
        title: Text(getTranslated(context, "changePassword"),style: TextStyle(color: Colors.purple[800]),),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.grey.withOpacity(0.1),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 35,right: 35,top: 25),
                child: Text(getTranslated(context,"currentPassword"),style: TextStyle(color: Colors.purple[800]),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: oldPassWordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    filled: true,
                    fillColor: Colors.purple.withOpacity(0.2),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(40)),
                  ),
                    validator: (val) {
                      if (val.isEmpty) {
                        return getTranslated(context,"passwordEmpty");
                      } else if (val.length < 6) {
                        return getTranslated(context,"passwordLessThan6");
                      }
                      return null;
                    },
                  onSaved: (val){
                    oldPassWordController.text=val;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35,right: 35,top: 10),
                child: Text(getTranslated(context,"newPassword"),style: TextStyle(color: Colors.purple[800]),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: newPassWordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    filled: true,
                    fillColor: Colors.purple.withOpacity(0.2),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(40)),
                  ),
                    validator: (val) {
                      if (val.isEmpty) {
                        return getTranslated(context,"passwordEmpty");
                      } else if (val.length < 6) {
                        return getTranslated(context,"passwordLessThan6");
                      }
                      return null;
                    },
                    onSaved: (val){
                      newPassWordController.text=val;
                    }
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35,right: 35,top: 10),
                child: Text(getTranslated(context,"confirmNewPassword"),style: TextStyle(color: Colors.purple[800]),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: confirmNewPassWordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    filled: true,
                    fillColor: Colors.purple.withOpacity(0.2),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(40)),
                  ),
                    validator: (val) {
                      if (val.isEmpty) {
                        return getTranslated(context,"passwordEmpty");
                      } else if (val != newPassWordController.text) {
                        return getTranslated(context,"passwordNotEqual");
                      }
                      return null;
                    },
                    onSaved: (val){
                      confirmNewPassWordController.text=val;
                    }
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BlocBuilder<GenericCubit<ModelChangePassword>, GenericState<ModelChangePassword>>(
        bloc: changePasswordCubit,
         builder: (context, state) {
          return ElevatedButton(
           style: ElevatedButton.styleFrom(
           padding: EdgeInsets.all(15),
           shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))),
            ),
            onPressed: (){
            if(formKey.currentState.validate()){
              onChangePasswordData(context);

            }else{
            return;
           }
           },
          child: Text(getTranslated(context,"confirmButton"),style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 18),),
      );
  },
),
    );
  }
}
