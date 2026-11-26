
import 'package:flutter/material.dart';
void main(){runApp(MeroKotha());}
class MeroKotha extends StatelessWidget{
  @override Widget build(BuildContext context){
    return MaterialApp(title:'Mero Kotha',debugShowCheckedModeBanner:false,
    theme:ThemeData(scaffoldBackgroundColor:Color(0xFF1A0F0A)),
    home:MainScreen());
  }
}
class Room{
  final String title,area,owner,phone,type; final int price; final String priceType; final double rating;
  Room(this.title,this.area,this.owner,this.phone,this.type,this.price,this.priceType,this.rating);
}
List<Room> rooms=[
  Room('Lakeside Deluxe Room','Lakeside, Pokhara','Ramesh Gurung','9841234567','Room',12000,'/month',4.8),
  Room('Thamel Tourist Hotel','Thamel, Kathmandu','Sita Shrestha','9851122334','Hotel',2500,'/night',4.9),
  Room('Kirtipur Student Hostel','Kirtipur, Kathmandu','Hari Adhikari','9860011223','Hostel/PG',6500,'/bed/month',4.5),
  Room('Baneshwor Flat 2BHK','Baneshwor, Kathmandu','Maya Tamang','9849012345','Flat',22000,'/month',4.6),
  Room('Butwal Family Room','Butwal','Keshav Poudel','9857023456','Room',9000,'/month',4.4),
];
class MainScreen extends StatefulWidget{ @override _MainScreenState createState()=>_MainScreenState(); }
class _MainScreenState extends State<MainScreen>{
  int tab=0; String cat='Sabai'; String filter='Sabai'; String loc='Pokhara, Nepal';
  String esewa='9841234567'; String khalti='9841234567';
  List<Map<String,String>> bookings=[]; List<Map<String,String>> chats=[]; List<String> favs=[];
  List<String> hisab=['Ram - Lakeside Room - Viewing Rs 100 - eSewa'];
  @override Widget build(BuildContext context){
    List<Room> f=rooms.where((r)=> (cat=='Sabai'||r.type==cat)).toList();
    return Scaffold(
      backgroundColor:Color(0xFF1A0F0A),
      body: tab==0 ? _home(f) : tab==1 ? _locPage() : tab==2 ? _searchPage() : tab==3 ? _chatPage() : tab==4 ? _favPage() : tab==5 ? _bookPage() : _profilePage(),
      bottomNavigationBar:Container(color:Color(0xFF1A0F0A),child:BottomNavigationBar(currentIndex:tab,backgroundColor:Color(0xFF1A0F0A),selectedItemColor:Color(0xFFFF6600),unselectedItemColor:Colors.white70,type:BottomNavigationBarType.fixed,onTap:(i)=>setState(()=>tab=i),items:[
        BottomNavigationBarItem(icon:Icon(Icons.home),label:'Home'),
        BottomNavigationBarItem(icon:Icon(Icons.location_on),label:'Location'),
        BottomNavigationBarItem(icon:Icon(Icons.search),label:'Search'),
        BottomNavigationBarItem(icon:Icon(Icons.chat),label:'Chats'),
        BottomNavigationBarItem(icon:Icon(Icons.favorite_border),label:'Favorites'),
        BottomNavigationBarItem(icon:Icon(Icons.calendar_today),label:'Bookings'),
        BottomNavigationBarItem(icon:Icon(Icons.person_outline),label:'Profile'),
      ])),
    );
  }
  Widget _home(List<Room> f){
    return SafeArea(child:SingleChildScrollView(child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
      // TOP GREEN HEADER - jaise screenshot me hai
      Container(decoration:BoxDecoration(gradient:LinearGradient(colors:[Color(0xFF1DB954),Color(0xFF0E7A3D)]),borderRadius:BorderRadius.vertical(bottom:Radius.circular(20))),padding:EdgeInsets.all(14),child:Column(children:[
        Row(children:[
          Expanded(child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text('Mero Kotha मेरा',style:TextStyle(color:Colors.white,fontWeight:FontWeight.bold,fontSize:22)),Text('नेपालको आफ्नै रूम रेन्टल एप',style:TextStyle(color:Colors.white,fontSize:12))])),
          Container(padding:EdgeInsets.symmetric(horizontal:10,vertical:6),decoration:BoxDecoration(color:Colors.black87,borderRadius:BorderRadius.circular(20)),child:Row(children:[Icon(Icons.language,color:Colors.white,size:16),SizedBox(width:4),Text('EN',style:TextStyle(color:Colors.white,fontWeight:FontWeight.bold))])),
          SizedBox(width:6),CircleAvatar(backgroundColor:Colors.black87,child:Icon(Icons.notifications,color:Colors.white)),
          SizedBox(width:6),Container(padding:EdgeInsets.symmetric(horizontal:10,vertical:8),decoration:BoxDecoration(color:Color(0xFF1DB954),borderRadius:BorderRadius.circular(20)),child:Row(children:[CircleAvatar(radius:10,backgroundColor:Colors.black,child:Text('G',style:TextStyle(color:Colors.green))),SizedBox(width:4),Text('Google',style:TextStyle(color:Colors.white,fontWeight:FontWeight.bold))])),
        ]),
        SizedBox(height:12),
        Row(children:[Container(padding:EdgeInsets.symmetric(horizontal:14,vertical:10),decoration:BoxDecoration(color:Colors.black87,borderRadius:BorderRadius.circular(25)),child:Row(children:[Text('📍 ',style:TextStyle(fontSize:16)),Text('Location Badalne',style:TextStyle(color:Color(0xFF1DB954),fontWeight:FontWeight.bold))]))]),
        SizedBox(height:10),
        Row(children:[Expanded(child:Container(padding:EdgeInsets.symmetric(vertical:12),decoration:BoxDecoration(color:Color(0xFFFF6600),borderRadius:BorderRadius.circular(25)),child:Row(mainAxisAlignment:MainAxisAlignment.center,children:[Text('🎯 ',style:TextStyle(fontSize:16)),Text('Mero Najik ko Room',style:TextStyle(color:Colors.white,fontWeight:FontWeight.bold))]))),SizedBox(width:8),Container(padding:EdgeInsets.symmetric(horizontal:16,vertical:12),decoration:BoxDecoration(color:Color(0xFF0E6A3A),borderRadius:BorderRadius.circular(25)),child:Row(children:[Icon(Icons.my_location,color:Colors.white,size:16),SizedBox(width:4),Text('GPS',style:TextStyle(color:Colors.white,fontWeight:FontWeight.bold))]))]),
      ])),
      SizedBox(height:14),
      // ORANGE BANNER - jaise screenshot me
      Container(margin:EdgeInsets.symmetric(horizontal:14),padding:EdgeInsets.all(18),decoration:BoxDecoration(gradient:LinearGradient(colors:[Color(0xFFFF6600),Color(0xFFFFB800)]),borderRadius:BorderRadius.circular(20)),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
        Text('नमस्ते! 🙏 Pokhara मा ९ वटा नयाँ कोठा!',style:TextStyle(color:Colors.white,fontSize:14)),
        Text('आजै आफ्नो कोठा खोज्नुहोस्',style:TextStyle(color:Colors.white,fontWeight:FontWeight.bold,fontSize:26)),
        SizedBox(height:6),Text('Lakeside • Damside • Bagar • Prithvi Chowk • Kundahar',style:TextStyle(color:Colors.white)),
        SizedBox(height:12),Container(padding:EdgeInsets.symmetric(horizontal:14,vertical:10),decoration:BoxDecoration(color:Colors.black87,borderRadius:BorderRadius.circular(20)),child:Text('Pokhara मात्र हेर्नुहोस् →',style:TextStyle(color:Color(0xFFFF6600),fontWeight:FontWeight.bold))),
      ])),
      SizedBox(height:16),
      Padding(padding:EdgeInsets.symmetric(horizontal:14),child:Text('CATEGORY छान्नुहोस्',style:TextStyle(color:Colors.white,fontWeight:FontWeight.bold))),
      SizedBox(height:10),
      SingleChildScrollView(scrollDirection:Axis.horizontal,child:Row(children:[
        _catBtn('🌐 Sabai','Sabai',true), _catBtn('🛏️ Room','Room',false), _catBtn('🏠 Flat','Flat',false), _catBtn('🎓 Hostel/PG','Hostel/PG',false), _catBtn('🏨 Hotel','Hotel',false),
      ])),
      SizedBox(height:10),
      SingleChildScrollView(scrollDirection:Axis.horizontal,child:Row(children:[
        _filterBtn('👥 Sabai','Sabai'), _filterBtn('For Tourist','For Tourist'), _filterBtn('For Student','For Student'), _filterBtn('For Family','For Family'),
      ])),
      SizedBox(height:14),
      // PURPLE PAISA CARD - jaise screenshot me
      Container(margin:EdgeInsets.symmetric(horizontal:14),padding:EdgeInsets.all(16),decoration:BoxDecoration(color:Color(0xFF7B4DFF),borderRadius:BorderRadius.circular(20)),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
        Text('₹  Paisa Kasari Aaucha? 💰',style:TextStyle(color:Colors.white,fontWeight:FontWeight.bold,fontSize:20)),
        Text('Mero Kotha बाट तपाईं (App Owner) ले कसरी पैसा कमाउनुहुन्छ?',style:TextStyle(color:Colors.white)),
        SizedBox(height:12),
        _paisaRow('1','Customer Book गर्छ — Room छानेर Visit Book गर्छ'),
        _paisaRow('2','eSewa / Khalti बाट Pay गर्छ — पैसा Mero Kotha को account मा आउँछ'),
        _paisaRow('3','Mero Kotha ले Commission राख्छ — बाँकी मालिक लाई'),
      ])),
      SizedBox(height:14),
      ...f.map((r)=>_roomCard(r)).toList(),
      SizedBox(height:20),
    ])));
  }
  Widget _catBtn(String label,String val,bool selected){
    bool isSel = cat==val;
    return GestureDetector(onTap:()=>setState(()=>cat=val),child:Container(margin:EdgeInsets.symmetric(horizontal:4),padding:EdgeInsets.symmetric(horizontal:16,vertical:12),decoration:BoxDecoration(color:isSel?Color(0xFFFF6600):Color(0xFF2A1A12),borderRadius:BorderRadius.circular(16),border:Border.all(color:Colors.white24)),child:Text(label,style:TextStyle(color:Colors.white,fontWeight:FontWeight.bold))));
  }
  Widget _filterBtn(String label,String val){
    bool isSel = filter==val;
    return GestureDetector(onTap:()=>setState(()=>filter=val),child:Container(margin:EdgeInsets.symmetric(horizontal:4),padding:EdgeInsets.symmetric(horizontal:14,vertical:10),decoration:BoxDecoration(color:isSel?Color(0xFF1DB954):Color(0xFF2A1A12),borderRadius:BorderRadius.circular(20)),child:Text(label,style:TextStyle(color:Colors.white,fontWeight:FontWeight.bold))));
  }
  Widget _paisaRow(String n,String t){
    return Container(margin:EdgeInsets.symmetric(vertical:4),padding:EdgeInsets.all(12),decoration:BoxDecoration(color:Colors.white.withOpacity(0.15),borderRadius:BorderRadius.circular(12)),child:Row(children:[CircleAvatar(backgroundColor:Colors.black,child:Text(n,style:TextStyle(color:Colors.white))),SizedBox(width:10),Expanded(child:Text(t,style:TextStyle(color:Colors.white)))]));
  }
  Widget _roomCard(Room r){
    bool isFav = favs.contains(r.title);
    return Card(margin:EdgeInsets.symmetric(horizontal:14,vertical:6),color:Colors.white,shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(16)),child:Padding(padding:EdgeInsets.all(12),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
      Container(height:140,width:double.infinity,decoration:BoxDecoration(color:Color(0xFFFFE8D6),borderRadius:BorderRadius.circular(12)),child:Center(child:Column(mainAxisAlignment:MainAxisAlignment.center,children:[Text('🏠',style:TextStyle(fontSize:48)),Text(r.type+' • Photo Gallery + Video ▶️',style:TextStyle(fontWeight:FontWeight.bold))]))),
      SizedBox(height:8),Row(children:[Expanded(child:Text(r.title,style:TextStyle(fontWeight:FontWeight.bold,fontSize:17))),IconButton(icon:Icon(isFav?Icons.favorite:Icons.favorite_border,color:isFav?Colors.red:Colors.grey),onPressed:()=>setState(()=> isFav?favs.remove(r.title):favs.add(r.title)))]),
      Text('📍 ${r.area} • Owner: ${r.owner}'),
      Row(children:[Icon(Icons.star,color:Colors.amber,size:16),Text(' ${r.rating} • 24 reviews'),Spacer(),Text('Rs ${r.price}',style:TextStyle(fontWeight:FontWeight.bold,fontSize:18,color:Color(0xFFFF6600))),Text(' ${r.priceType}')]),
      SizedBox(height:8),Row(children:[Expanded(child:ElevatedButton(onPressed:()=>_pay(r,100,'Viewing Fee'),child:Text('Owner No. - Rs 100'),style:ElevatedButton.styleFrom(backgroundColor:Colors.green))),SizedBox(width:8),Expanded(child:ElevatedButton(onPressed:()=>_pay(r,500,'Service Fee'),child:Text('Book - Rs 500'),style:ElevatedButton.styleFrom(backgroundColor:Color(0xFFFF6600))))]),
      SizedBox(height:6),Row(children:[Expanded(child:OutlinedButton(onPressed:()=>_openChat(r),child:Text('💬 Chat Garne'))),SizedBox(width:8),Expanded(child:OutlinedButton(onPressed:()=>_detail(r),child:Text('Herne →')))]),
    ])));
  }
  void _detail(Room r){ Navigator.push(context,MaterialPageRoute(builder:(_)=>DetailPage(room:r,onChat:()=>_openChat(r),onBook:()=>_pay(r,500,'Service Fee'),onPay100:()=>_pay(r,100,'Viewing Fee')))); }
  void _openChat(Room r){ Navigator.push(context,MaterialPageRoute(builder:(_)=>ChatPage(room:r,onSend:(m){setState(()=>chats.add({'room':r.title,'msg':m}));}))); }
  void _pay(Room r,int amt,String type){
    showModalBottomSheet(context:context,builder:(_)=>Container(padding:EdgeInsets.all(16),color:Colors.white,child:Column(mainAxisSize:MainAxisSize.min,crossAxisAlignment:CrossAxisAlignment.start,children:[
      Text('$type - Rs $amt',style:TextStyle(fontWeight:FontWeight.bold,fontSize:18)),
      Text('Mero Personal eSewa: $esewa'), Text('Mero Personal Khalti: $khalti'),
      SizedBox(height:8),Container(height:110,width:110,decoration:BoxDecoration(border:Border.all(),color:Colors.white),child:Center(child:Text('QR\n$esewa',textAlign:TextAlign.center,style:TextStyle(fontWeight:FontWeight.bold)))),
      TextField(decoration:InputDecoration(labelText:'Transaction ID - ABC123')),
      SizedBox(height:10),ElevatedButton(onPressed:(){Navigator.pop(context);setState((){hisab.add('${r.title} - $type Rs $amt'); bookings.add({'room':r.title,'owner':r.owner,'phone':r.phone,'amt':'$amt','status':'Confirm'});}); ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('Paisa milyo! Owner: ${r.phone} - Baki rent malik lai sidha dinus')));},child:Text('Maile Paisa Pathaye'),style:ElevatedButton.styleFrom(minimumSize:Size(double.infinity,48),backgroundColor:Colors.green)),
    ])));
  }
  Widget _locPage(){
    return SafeArea(child:ListView(padding:EdgeInsets.all(16),children:[
      Text('Location Channe 📍',style:TextStyle(color:Colors.white,fontWeight:FontWeight.bold,fontSize:22)),
      SizedBox(height:6),Text('Mero Najik ko Room - GPS',style:TextStyle(color:Colors.white70)),
      SizedBox(height:12),
      ...['Pokhara, Nepal','Kathmandu - Thamel','Kathmandu - Baneshwor','Kathmandu - Kirtipur','Butwal','Chitwan'].map((l)=>Card(color:Colors.white,child:ListTile(leading:Icon(Icons.location_on,color:Colors.green),title:Text(l),subtitle:Text('Yaha 5-12 room khali cha'),trailing: loc==l ? Icon(Icons.check,color:Colors.green) : null,onTap:()=>setState((){loc=l; tab=0;})))).toList(),
      Container(padding:EdgeInsets.all(12),decoration:BoxDecoration(color:Color(0xFFFF6600),borderRadius:BorderRadius.circular(12)),child:Row(children:[Icon(Icons.my_location,color:Colors.white),SizedBox(width:8),Text('GPS le mero location leu',style:TextStyle(color:Colors.white,fontWeight:FontWeight.bold))])),
    ]));
  }
  Widget _searchPage(){
    return SafeArea(child:Column(children:[Padding(padding:EdgeInsets.all(14),child:TextField(style:TextStyle(color:Colors.white),decoration:InputDecoration(hintText:'Khojne - Pokhara, Thamel...',hintStyle:TextStyle(color:Colors.white54),prefixIcon:Icon(Icons.search,color:Colors.white),filled:true,fillColor:Color(0xFF2A1A12),border:OutlineInputBorder(borderRadius:BorderRadius.circular(12))))),Expanded(child:ListView(children:rooms.map((r)=>ListTile(title:Text(r.title,style:TextStyle(color:Colors.white)),subtitle:Text(r.area,style:TextStyle(color:Colors.white70)),trailing:Text('Rs ${r.price}',style:TextStyle(color:Color(0xFFFF6600),fontWeight:FontWeight.bold)),onTap:()=>_detail(r))).toList()))]));
  }
  Widget _chatPage(){
    if(chats.isEmpty) return SafeArea(child:Center(child:Text('Koi chat chaina\nRoom bata Chat Garne dabaaunus',textAlign:TextAlign.center,style:TextStyle(color:Colors.white))));
    return SafeArea(child:ListView(children:chats.map((c)=>Card(color:Colors.white,child:ListTile(leading:CircleAvatar(child:Text('👤')),title:Text(c['room']!),subtitle:Text(c['msg']!)))).toList()));
  }
  Widget _favPage(){
    if(favs.isEmpty) return SafeArea(child:Center(child:Text('Koi favorite chaina\nDil ❤️ dabaaunus',textAlign:TextAlign.center,style:TextStyle(color:Colors.white))));
    return SafeArea(child:ListView(children:favs.map((f)=>ListTile(title:Text(f,style:TextStyle(color:Colors.white)))).toList()));
  }
  Widget _bookPage(){
    if(bookings.isEmpty) return SafeArea(child:Center(child:Text('Koi booking chaina',style:TextStyle(color:Colors.white))));
    return SafeArea(child:ListView(children:bookings.map((b)=>Card(color:Colors.white,child:ListTile(title:Text(b['room']!),subtitle:Text('Owner: ${b['owner']} • ${b['phone']}'),trailing:Chip(label:Text(b['status']!))))).toList()));
  }
  Widget _profilePage(){
    return SafeArea(child:SingleChildScrollView(padding:EdgeInsets.all(16),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
      Text('Profile',style:TextStyle(color:Colors.white,fontWeight:FontWeight.bold,fontSize:22)),
      SizedBox(height:12),Text('Mero Personal Payment',style:TextStyle(color:Colors.white,fontWeight:FontWeight.bold,fontSize:18)),
      Text('Personal Mode ON',style:TextStyle(color:Colors.green)),
      SizedBox(height:10),TextField(style:TextStyle(color:Colors.black),decoration:InputDecoration(filled:true,fillColor:Colors.white,labelText:'Personal eSewa Number',hintText:'98XXXXXXXX',border:OutlineInputBorder()),onChanged:(v)=>esewa=v),
      SizedBox(height:10),TextField(style:TextStyle(color:Colors.black),decoration:InputDecoration(filled:true,fillColor:Colors.white,labelText:'Personal Khalti Number',hintText:'98XXXXXXXX',border:OutlineInputBorder()),onChanged:(v)=>khalti=v),
      SizedBox(height:10),ElevatedButton(onPressed:()=>ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('Save bhayo!'))),child:Text('Save Garnus'),style:ElevatedButton.styleFrom(minimumSize:Size(double.infinity,48),backgroundColor:Color(0xFFFF6600))),
      SizedBox(height:10),Container(height:110,width:110,color:Colors.white,child:Center(child:Text('QR\n$esewa'))),
      SizedBox(height:16),Text('Hisaab Kitab',style:TextStyle(color:Colors.white,fontWeight:FontWeight.bold,fontSize:18)),
      ...hisab.map((h)=>Card(color:Colors.white,child:ListTile(title:Text(h)))).toList(),
      ListTile(title:Text('Ma Malik Hu / Owner Dashboard',style:TextStyle(color:Colors.white)),leading:Icon(Icons.store,color:Colors.white)),
      ListTile(title:Text('Admin Approval',style:TextStyle(color:Colors.white)),leading:Icon(Icons.admin_panel_settings,color:Colors.white)),
      ListTile(title:Text('Mero Complaint',style:TextStyle(color:Colors.white)),leading:Icon(Icons.flag,color:Colors.white)),
      ListTile(title:Text('Terms & Privacy',style:TextStyle(color:Colors.white)),leading:Icon(Icons.description,color:Colors.white)),
    ])));
  }
}
class DetailPage extends StatelessWidget{
  final Room room; final VoidCallback onChat,onBook,onPay100;
  DetailPage({required this.room,required this.onChat,required this.onBook,required this.onPay100});
  @override Widget build(BuildContext context){
    return Scaffold(backgroundColor:Colors.white,appBar:AppBar(title:Text(room.title),backgroundColor:Color(0xFFFF6600)),body:SingleChildScrollView(child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
      Container(height:220,color:Color(0xFFFFE8D6),child:Center(child:Column(mainAxisAlignment:MainAxisAlignment.center,children:[Text('🏠',style:TextStyle(fontSize:60)),Text(room.type+' • Photo Gallery + Video ▶️')] ))),
      Padding(padding:EdgeInsets.all(16),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
        Text('Rs ${room.price} ${room.priceType}',style:TextStyle(fontSize:22,fontWeight:FontWeight.bold,color:Color(0xFFFF6600))),
        Text('📍 ${room.area}'), Text('Owner: ${room.owner}'),
        SizedBox(height:10),Text('Reviews ⭐ ${room.rating}',style:TextStyle(fontWeight:FontWeight.bold)), Text('Ram: Ramro room cha ⭐⭐⭐⭐⭐'),
        SizedBox(height:16),ElevatedButton(onPressed:onChat,child:Text('💬 Chat Garne'),style:ElevatedButton.styleFrom(minimumSize:Size(double.infinity,48))),
        SizedBox(height:10),ElevatedButton(onPressed:onBook,child:Text('Book - Rs 500'),style:ElevatedButton.styleFrom(minimumSize:Size(double.infinity,48),backgroundColor:Colors.green)),
        SizedBox(height:10),ElevatedButton(onPressed:onPay100,child:Text('Owner Number - Rs 100'),style:ElevatedButton.styleFrom(minimumSize:Size(double.infinity,48),backgroundColor:Colors.orange)),
        SizedBox(height:10),OutlinedButton(onPressed:(){},child:Text('🚩 Report / Complaint'),style:OutlinedButton.styleFrom(minimumSize:Size(double.infinity,48))),
      ])),
    ])));
  }
}
class ChatPage extends StatefulWidget{ final Room room; final Function(String) onSend; ChatPage({required this.room,required this.onSend}); @override _ChatPageState createState()=>_ChatPageState(); }
class _ChatPageState extends State<ChatPage>{
  List<String> msgs=['Namaste! Room khali cha?']; TextEditingController c=TextEditingController();
  @override Widget build(BuildContext context){
    return Scaffold(appBar:AppBar(title:Text(widget.room.owner),backgroundColor:Color(0xFFFF6600)),body:Column(children:[
      Container(color:Colors.green.shade100,padding:EdgeInsets.all(8),child:Text('● Online')),
      Expanded(child:ListView(children:msgs.map((m)=>Align(alignment:Alignment.centerRight,child:Container(margin:EdgeInsets.all(8),padding:EdgeInsets.all(12),decoration:BoxDecoration(color:Colors.orange.shade100,borderRadius:BorderRadius.circular(12)),child:Text(m)))).toList())),
      Row(children:[TextButton(onPressed:()=>setState(()=>msgs.add('Visit garna milcha?')),child:Text('Visit garna milcha?')),TextButton(onPressed:()=>setState(()=>msgs.add('Kati ho rent?')),child:Text('Kati ho rent?'))]),
      Row(children:[Expanded(child:TextField(controller:c,decoration:InputDecoration(hintText:'Message lekhnus...'))),IconButton(icon:Icon(Icons.send),onPressed:(){if(c.text.isNotEmpty){String t=c.text; setState(()=>msgs.add(t)); widget.onSend(t); c.clear(); Future.delayed(Duration(seconds:2),()=>setState(()=>msgs.add('Hajur, room khali cha')));}})]),
    ]));
  }
}
