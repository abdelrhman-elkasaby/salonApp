part of 'edit_account_info_imports.dart';
class EditAccount extends StatefulWidget {
  final String imageUrl;
  const EditAccount( this.imageUrl);
  @override
  _EditAccountState createState() => _EditAccountState();
}
class _EditAccountState extends State<EditAccount> with EditAccountData{
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
        elevation: 0.0,
        title: Text(getTranslated(context, "accountInformation"),
            style: TextStyle(
                color: Colors.purple[800], fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 25,
            ),
            Stack(
              children: [
                BlocBuilder<GenericCubit, GenericState>(
                  bloc: pictureCubit,
                  builder: (context, state) {
                   return CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 60,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child:newImage==null?Image.network(
                        widget.imageUrl,
                        fit: BoxFit.fill,
                        width: 120,
                        height: 120,
                      ):Image.file(
                        newImage,
                        fit: BoxFit.fill,
                        width: 120,
                        height: 120,
                      ),
                    ));
  },
),
                Positioned(
                  bottom: 1,
                  left: 1,
                  child: IconButton(
                      icon: ImageIcon(AssetImage('assets/icons/editpic.png')),
                      onPressed: () {
                        _showPicker(context);
                      }),
                )
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 20,
                  width: MediaQuery.of(context).size.width*0.3,
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                        color: Colors.amber, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    getTranslated(context, "phone"),
                    style: TextStyle(
                        color: Colors.purple[800], fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: Colors.purple.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(40)),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 15),
                      child: TextField(
                        controller:phoneController,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                            color: Colors.purple[800],
                            fontWeight: FontWeight.bold),
                      ),
                    )),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChangePassword())),
              child: Text(
                getTranslated(context, "changePassword"),
                style: TextStyle(
                    color: Colors.amber,
                    decoration: TextDecoration.underline,
                    fontSize: 18),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(15),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))),
        ),
        onPressed: (){
          onUpdateProfileData(context);
        },
        child: Text(getTranslated(context,"confirmButton"),style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 18),),
      ),
    );
  }
}
