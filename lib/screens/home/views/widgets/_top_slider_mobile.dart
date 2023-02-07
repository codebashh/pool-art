// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../../home.dart';

class _TopSliderMobile extends StatefulWidget {
  final Project project;
  const _TopSliderMobile({
    Key? key,
    required this.project,
  }) : super(key: key);

  @override
  State<_TopSliderMobile> createState() => __TopSliderMobileState();
}

class __TopSliderMobileState extends State<_TopSliderMobile> {
  @override
  Widget build(BuildContext context) {
    final appProv = Provider.of<AppProvider>(context);
    return SizedBox(
      height: AppDimensions.size!.height * 0.4,
      width: double.infinity,
      child: CarouselSlider(
        carouselController: appProv.controller,
        items: widget.project.images
            .asMap()
            .entries
            .map(
              (e) => Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: e.value,
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                  Container(
                    width: double.infinity,
                    height: AppDimensions.size!.height * 0.50,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        end: Alignment.centerRight,
                        begin: Alignment.centerLeft,
                        colors: [
                          Colors.white.withOpacity(0.6),
                          Colors.white.withOpacity(0.5),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.17,
                      ),
                      SectionCardMobile(
                        height: MediaQuery.of(context).size.height * 0.20,
                        project: widget.project,
                        isInverted: false,
                        imagePath: null,
                        bottomWidget: AppTextIconButton(
                          onPressed: () {},
                          text: 'See Projects',
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
            .toList(),
        options: CarouselOptions(
          disableCenter: true,
          autoPlay: true,
          viewportFraction: 1,
          autoPlayCurve: Curves.linearToEaseOut,
          autoPlayAnimationDuration: const Duration(
            milliseconds: 700,
          ),
        ),
      ),
    );
  }
}
