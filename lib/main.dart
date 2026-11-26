import 'package:flutter/material.dart';
void main(){runApp(MeroKotha());}
class MeroKotha extends StatelessWidget{
  @override Widget build(BuildContext context){
    return MaterialApp(title:'Mero Kotha',debugShowCheckedModeBanner:false,
    theme:ThemeData(primaryColor:Color(0xFFFF6600)),
    home:HomePage());
  }
}
class Room{
  final String title,area,owner,phone,type; final int price; final String priceType;
  Room(this.title,this.area,this.owner,this.phone,this.type,this.price,this.priceType);
}
List<Room> rooms=[
  Room('Lakeside Deluxe Room','Lakeside, Pokhara','Ramesh Gurung','9841234567','Room',12000,'/month'),
  Room('Thamel Tourist Hotel','Thamel, Kathmandu','Sita Shrestha','9851122334','Hotel',2500,'/night'),
  Room('Kirtipur Student Hostel','Kirtipur, Kathmandu','Hari Adhikari','9860011223','Hostel-PG',6500,'/bed/month'),
  Room('Baneshwor Flat 2BHK','Baneshwor, Kathmandu','Maya Tamang','9849012345','Flat',22000,'/month'),
  Room('Butwal Family Room','Butwal','Keshav Poudel','9857023456','Room',9000,'/month'),
];
class HomePage extends StatefulWidget{ @override _HomePageState createState()=>_HomePageState(); }
class _HomePageState extends State<HomePage>{
  int tab=0; String cat='Sabai'; String esewa='9841234567'; String khalti='9841234567';
  List<String> hisab=[];
  @override Widget build(BuildContext context){
    List<Room> f=rooms.where((r)=> cat=='Sabai'||r.type==cat).toList();
    return Scaffold(
      appBar:AppBar(backgroundColor:Color(0xFFFF6600),title:Text('MERO KOTHA 🏠')),
      body: tab==0 ? SingleChildScrollView(child:Column(children:[
        Container(color:Colors.green,padding:EdgeInsets.all(12),child:Row(children:[Icon(Icons.location_on,color:Colors.white),SizedBox(width:8),Text('Pokhara, Nepal - 5 room khali cha',style:TextStyle(color:Colors.white,fontWeight:FontWeight.bold))])),
        SingleChildScrollView(scrollDirection:Axis.horizontal,child:Row(children:['Sabai','Room','Flat','Hostel-PG','Hotel'].map((c)=>Padding(padding:EdgeInsets.all(4),child:ChoiceChip(label:Text(c),selected:cat==c,onSelected:(_)=>setState(()=>cat=c)))).toList())),
        ...f.map((r)=>Card(margin:EdgeInsets.all(10),child:Padding(padding:EdgeInsets.all(12),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
          Text(r.title,style:TextStyle(fontWeight:FontWeight.bold,fontSize:17)),
          Text('📍 ${r.area} • Owner: ${r.owner}'),
          SizedBox(height:6),Row(children:[Text('Rs ${r.price}',style:TextStyle(fontWeight:FontWeight.bold,fontSize:18,color:Color(0xFFFF6600))),Text(' ${r.priceType}'),Spacer(),Chip(label:Text(r.type))]),
          SizedBox(height:6),Text('⭐ 4.8 • Photo Gallery - 3 photos + Video Tour'),
          SizedBox(height:8),Row(children:[
            Expanded(child:ElevatedButton(onPressed:()=>_pay(context,r,100,'Viewing Fee'),child:Text('Owner Number - Rs 100'))),
            SizedBox(width:8),Expanded(child:ElevatedButton(onPressed:()=>_pay(context,r,500,'Service Fee'),child:Text('Book - Rs 500'),style:ElevatedButton.styleFrom(backgroundColor:Colors.green))),
          ]),
        ])))).toList(),
      ]))
      : tab==1 ? ListView(children: hisab.isEmpty?[ListTile(title:Text('Koi hisaab chaina'))]:hisab.map((h)=>ListTile(title:Text(h))).toList())
      : SingleChildScrollView(padding:EdgeInsets.all(16),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
        Text('Mero Personal Payment',style:TextStyle(fontWeight:FontWeight.bold,fontSize:18)),
        Text('Personal Mode ON - Business chaina',style:TextStyle(color:Colors.green)),
        SizedBox(height:10),TextField(decoration:InputDecoration(labelText:'Personal eSewa Number',hintText:'98XXXXXXXX',border:OutlineInputBorder()),onChanged:(v)=>esewa=v),
        SizedBox(height:10),TextField(decoration:InputDecoration(labelText:'Personal Khalti Number',hintText:'98XXXXXXXX',border:OutlineInputBorder()),onChanged:(v)=>khalti=v),
        SizedBox(height:10),ElevatedButton(onPressed:(){ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('Save bhayo! eSewa: $esewa')));},child:Text('Save Garnus'),style:ElevatedButton.styleFrom(minimumSize:Size(double.infinity,48))),
        SizedBox(height:10),Text('QR Auto Bancha - Number dalne bittikai'),
        Container(height:110,width:110,color:Colors.white,child:Center(child:Text('QR\n$esewa',textAlign:TextAlign.center))),
        SizedBox(height:20),Text('Hisaab Kitab - Total: Rs ${hisab.length*100}'),
        Text('Ma Malik Hu - Mero Room Khali / Bhariyo'),
        Text('Terms & Privacy - Play Store ke liye'),
      ])),
      bottomNavigationBar:BottomNavigationBar(currentIndex:tab,selectedItemColor:Color(0xFFFF6600),onTap:(i)=>setState(()=>tab=i),items:[
        BottomNavigationBarItem(icon:Icon(Icons.home),label:'Home'),
        BottomNavigationBarItem(icon:Icon(Icons.book),label:'Hisaab'),
        BottomNavigationBarItem(icon:Icon(Icons.person),label:'Profile'),
      ]),
    );
  }
  void _pay(BuildContext context, Room r, int amt, String type){
    showModalBottomSheet(context:context,builder:(_)=>Container(padding:EdgeInsets.all(16),child:Column(mainAxisSize:MainAxisSize.min,crossAxisAlignment:CrossAxisAlignment.start,children:[
      Text('$type - Rs $amt',style:TextStyle(fontWeight:FontWeight.bold,fontSize:18)),
      Text('Mero eSewa: $esewa'),
      Text('Mero Khalti: $khalti'),
      SizedBox(height:8),Container(height:100,width:100,color:Colors.white,child:Center(child:Text('QR\n$esewa'))),
      TextField(decoration:InputDecoration(labelText:'Transaction ID - ABC123')),
      SizedBox(height:10),ElevatedButton(onPressed:(){Navigator.pop(context);setState(()=>hisab.add('${r.title} - $type Rs $amt'));ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('Paisa milyo! Owner number: ${r.phone} - Baki rent malik lai sidha dinus')));},child:Text('Maile Paisa Pathaye'),style:ElevatedButton.styleFrom(minimumSize:Size(double.infinity,48))),
    ])));
  }
}
