import 'package:flutter/material.dart';

typedef OnNavigationItemSelected(int index);
const Color OFFCOLOR = Colors.white;
const Color ONCOLOR = Colors.blue;
class SideNavigationItem{
  final IconData iconData;
  Icon icon;
  Color color;
  final String title;


  bool selected;
  SideNavigationItem({
    @required this.iconData,
    @required this.title,
    this.selected = false,
    this.color = OFFCOLOR
    
  });
}
class SideNavigationItemWidget extends StatefulWidget {
  final SideNavigationItem item;
  SideNavigationItemWidget({
    Key key,
    @required this.item
  })
      :super(key: key);
  @override
  _SideNavigationItemWidgetState createState() => _SideNavigationItemWidgetState();
}
class _SideNavigationItemWidgetState extends State<SideNavigationItemWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    widget.item.icon = Icon(widget.item.iconData, size: 30, color: widget.item.color,);
    return Container(
      // decoration: BoxDecoration(
      //     border: widget.item.selected ?
      //     Border(left: BorderSide(color: Colors.blue, width: 3.0)) : Border()
          
      // ),
      child: Padding(
        padding: EdgeInsets.only(top: 25.0, bottom: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            widget.item.icon,
            Padding(padding: EdgeInsets.all(10.0),
              child: Text(widget.item.title,
                textAlign: TextAlign.center,
                style: theme.primaryTextTheme.caption.copyWith(color: widget.item.color),),
            )
          ],
        ),
      ),
    );
  }
}


class SideNavigation extends StatefulWidget {
  final List<SideNavigationItem> navItems;
  final OnNavigationItemSelected itemSelected;
  final int initialIndex;
  final List<Widget> actions;
  SideNavigation({
    Key key,
    @required this.navItems,
    @required this.itemSelected,
    @required this.initialIndex,
    @required this.actions
  });
  @override
  _SideNavigationState createState() => _SideNavigationState(
      navItems: this.navItems,
      initializeIndex: this.initialIndex,
      actions: this.actions
  );
}
class _SideNavigationState extends State<SideNavigation> {
  final List<SideNavigationItem> navItems;
  final List<Widget> actions;
  final int initializeIndex;
  var currentIndex;

  _SideNavigationState({
    Key key,
    @required this.navItems,
    @required this.initializeIndex,
    @required this.actions
  });

  @override
  void initState() {
    super.initState();
    if(navItems.length > 0 && initializeIndex <= navItems.length){
      navItems[initializeIndex].selected = true;
      navItems[initializeIndex].color = ONCOLOR;
      currentIndex = initializeIndex;
    }
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Container(
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.8),
            boxShadow: [
              BoxShadow(color: Colors.grey, blurRadius: 6.0)
            ]
        ),
        width: size.width/13,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ListView.separated(
              separatorBuilder: (context, index){
                return Divider(color: Colors.black.withOpacity(0.8), height: 1.0,);
              },
              itemBuilder: (context, index){
                var item = navItems[index];
                return GestureDetector(
                  child: SideNavigationItemWidget(item: item,),
                  onTap: (){
                    setState(() {
                      navItems.forEach((item) => item.selected = false);
                      navItems.forEach((item) => item.color = OFFCOLOR);
                      
                      item.selected = true;
                      item.color = ONCOLOR;
                    });
                    if(index != currentIndex){
                      widget.itemSelected(index);
                      currentIndex = index;
                    }
                  },
                );
              },
              itemCount: navItems.length,
              shrinkWrap: true,
              primary: false,
            ),
            Expanded(
              child: Container(),
            ),
            Container(
              child: ListView.builder(
                  itemCount: actions == null? 0 : actions.length,
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (context, index){
                    return actions[index];
                  }),
            )
          ],
        )
    );
  }
}