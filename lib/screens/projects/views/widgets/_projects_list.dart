part of '../../projects.dart';

class _ProjectsList extends StatelessWidget {
  const _ProjectsList({
    Key? key,
    this.list,
  }) : super(key: key);

  final List<Project>? list;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: Responsive.isMobile(context) ? 2 : 4,
        childAspectRatio: Responsive.isMobile(context) ? 1 : 1.3,
        mainAxisSpacing: Responsive.isMobile(context)
            ? AppDimensions.normalize(3)
            : AppDimensions.normalize(4),
        crossAxisSpacing: Responsive.isMobile(context)
            ? AppDimensions.normalize(4)
            : AppDimensions.normalize(6),
      ),
      itemCount: list!.length,
      itemBuilder: (context, index) => _ProjectCard(
        imageURL:
            list![index].images.isNotEmpty ? list![index].images[0] : 'Yes',
        title: list![index].title,
        description: list![index].description,
        isFinal: index + 1 == 12,
      ),
    );
  }
}
