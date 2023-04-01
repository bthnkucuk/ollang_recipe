part of '../controller/home_controller.dart';

class _SearchHistory extends StatefulWidget {
  final Offset offset;
  final List<String> list;
  final Function(String value) onDelete;
  const _SearchHistory({
    Key? key,
    required this.offset,
    required this.list,
    required this.onDelete,
  }) : super(key: key);

  @override
  State<_SearchHistory> createState() => _SearchHistoryState();
}

class _SearchHistoryState extends State<_SearchHistory>
    with SingleTickerProviderStateMixin {
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
      setState(() {
        print(widget.list);
      });
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
          top: widget.offset.dy + 60.h,
          width: MyMediaQuery.width,
          height: (30.h * widget.list.length).toDouble(),
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: FadeTransition(
              opacity: animation,
              child: Material(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.5),
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(10.w),
                ),
                color: Theme.of(context).colorScheme.primaryContainer,
                elevation: 10,
                shadowColor: Colors.grey.withOpacity(0.5),
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      Divider(indent: 20.w, endIndent: 20.w),
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.list.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 30.h,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.history,
                              color: Theme.of(context).colorScheme.onPrimary,
                              size: 20.w,
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              widget.list[index],
                              style: s14W600(context),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () async {
                                await widget.onDelete(widget.list[index]);
                              },
                              child: Text(
                                'Remove',
                                style: s12W400(context).copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary),
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
