part of 'More_info_page_imports.dart';
class MoreInfoPageData{
  Widget buildListTile(
      String imageUrl, String title, String subTitle, Function function) {
    return ListTile(
      leading: Image(
        image: AssetImage(imageUrl),
        width: 50,
        height: 50,
      ),
      title: Text(
        title,
        style:
        TextStyle(color: Colors.purple[800], fontWeight: FontWeight.bold),
      ),
      subtitle: Text(subTitle,
          style: TextStyle(color: Colors.purple[800], fontSize: 12)),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Colors.purple[800],
      ),
      onTap: function,
      tileColor: Colors.white,
    );
  }
}