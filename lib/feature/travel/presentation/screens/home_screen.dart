import 'package:travel_app/core/shared/export/export.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  final indexProvider = StateProvider<int>((ref) => 0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  final List<Widget> _pages = [
    const MyTripScreen(),
    AddTripScreen(),
    Container(
      color: Colors.green,
    ),
  ];

  final List<BottomNavigationBarItem> _bottomNavigationBarItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.list),
      label: 'My trips',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.add),
      label: 'Add trips',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.map),
      label: 'Maps',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const HomeAppbar(),
      body: Consumer(builder: (context, ref, child) {
        _pageController.addListener(() {
          ref
              .read(indexProvider.notifier)
              .update((state) => _pageController.page!.round());
        });
        return PageView(
          controller: _pageController,
          children: _pages,
        );
      }),
      bottomNavigationBar: Consumer(builder: (context, ref, _) {
        final index = ref.watch(indexProvider);
        return BottomNavigationBar(
          currentIndex: index,
          items: _bottomNavigationBarItems,
          onTap: (index) {
            _pageController.animateToPage(index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut);
          },
        );
      }),
    );
  }
}
