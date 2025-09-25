import 'package:flutter/material.dart';
import 'fetch_data.dart';

class ApiPage extends StatelessWidget {
  const ApiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Post>>(
      future: fetchPosts(6),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Failed to load posts', style: TextStyle(fontSize: 16)),
                  const SizedBox(height: 8),
                  Text(snapshot.error.toString()),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () => (context as Element).reassemble(),
                    child: const Text('Retry'),
                  )
                ],
              ),
            ),
          );
        } else {
          final posts = snapshot.data ?? [];
          return ListView.separated(
            itemCount: posts.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, i) {
              final p = posts[i];
              return ListTile(
                leading: CircleAvatar(child: Text('${p.id}')),
                title: Text(p.title, maxLines: 1, overflow: TextOverflow.ellipsis),
                subtitle: Text(p.body, maxLines: 2, overflow: TextOverflow.ellipsis),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text(p.title),
                      content: SingleChildScrollView(child: Text(p.body)),
                      actions: [TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Close'))],
                    ),
                  );
                },
              );
            },
          );
        }
      },
    );
  }
}
