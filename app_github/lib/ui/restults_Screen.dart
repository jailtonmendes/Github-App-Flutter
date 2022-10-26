import 'package:app_github/github_repository.dart';
import 'package:app_github/models/github_model.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class RestultsScreen extends StatelessWidget {
  final String? username;
  RestultsScreen({super.key, this.username});

  final repository = GithubRepository();

  Widget _buildError() {
    return const Center(
        child: Text(
      'Erro ao buscar dados',
      style: TextStyle(fontSize: 25, color: Colors.red),
    ));
  }

  Widget _buildLoader() {
    return Center(
        child: LoadingAnimationWidget.staggeredDotsWave(
      color: const Color.fromARGB(255, 0, 0, 0),
      size: 200,
    ));
  }

  _buildBody() {
    return FutureBuilder<GithubModel>(
        future: repository.fecthGithub(username),
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return _buildSuccess(snapshot.data!);
          }
          if (snapshot.hasError) {
            return _buildError();
          }
          return _buildLoader();
        });
  }

  Widget _buildSuccess(GithubModel model) {
    return Center(
      child: SizedBox(
        height: 500,
        width: 500,
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.black,
              radius: 90.0,
              child: CircleAvatar(
                backgroundImage: NetworkImage(model.avatarUrl),
                radius: 80,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              model.name,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              model.blog,
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              model.location,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              child: OutlinedButton.icon(
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(color: Colors.black, width: 1),
                ),
                onPressed: () {},
                icon: const Icon(Icons.public),
                label: Text(
                  'Publicações: ${model.publicRepos.toString()}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GitHub Users'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: _buildBody(),
    );
  }
}
