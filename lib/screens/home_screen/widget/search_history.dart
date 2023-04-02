part of '../controller/home_controller.dart';

///[_SearchHistory] is the widget that shows the search history.
///It is a overlay widget that is displayed on top of the screen.
class _SearchHistory extends StatefulWidget {
  final Offset offset;
  final List<String> list;
  final Function(String value) onDelete;
  final Function(String value) onTap;

  const _SearchHistory({
    Key? key,
    required this.offset,
    required this.list,
    required this.onDelete,
    required this.onTap,
  }) : super(key: key);

  @override
  State<_SearchHistory> createState() => _SearchHistoryState();
}

class _SearchHistoryState extends State<_SearchHistory> with SingleTickerProviderStateMixin {
  bool displayOverly = true;

  late AnimationController animController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    prepareAnimations();

    runExpand();
  }

  void prepareAnimations() {
    animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    )..addStatusListener((status) {});

    animation = CurvedAnimation(
      parent: animController,
      curve: Curves.linearToEaseOut,
      reverseCurve: Curves.linearToEaseOut,
    );
  }

  void runExpand() {
    if (displayOverly) {
      animController.forward();
    } else {
      animController.reverse();
    }
  }

  @override
  void didUpdateWidget(_SearchHistory oldWidget) {
    super.didUpdateWidget(oldWidget);
    runExpand();

    if (widget.list != oldWidget.list) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    animController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            height: MyMediaQuery.height,
            width: MyMediaQuery.width,
            color: Colors.transparent,
          ),
        ),
        Positioned(
          top: widget.offset.dy + 46.h,
          width: MyMediaQuery.width,
          height: (40.h * widget.list.length).toDouble(),
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: FadeTransition(
              opacity: animation,
              child: Material(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                    width: 0.5,
                  ),
                  borderRadius: const BorderRadius.vertical(bottom: Radius.circular(10)),
                ),
                color: Theme.of(context).colorScheme.primaryContainer,
                elevation: 10,
                shadowColor: Colors.grey.withOpacity(0.5),
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(indent: 20.w, endIndent: 20.w),
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.list.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 40.h,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.history,
                              color: Theme.of(context).colorScheme.onPrimary,
                              size: 20,
                            ),
                            SizedBox(width: 15.w),
                            GestureDetector(
                              onTap: () async => await widget.onTap(widget.list[index]),
                              child: Text(
                                widget.list[index],
                                style: s16W400(context).copyWith(fontSize: 15),
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () async => await widget.onDelete(widget.list[index]),
                              child: Text(
                                'Remove',
                                style: s12W400(context).copyWith(color: Theme.of(context).colorScheme.primary),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
