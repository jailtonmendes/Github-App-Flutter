import 'package:app_github/github_repository.dart';
import 'package:app_github/models/github_model.dart';
import 'package:flutter/material.dart';

class RestultsScreen extends StatelessWidget {
  RestultsScreen({super.key});

  final repository = GithubRepository();

  Widget _buildError() {
    return const Center(child: Text('Erro ao buscar dados'));
  }

  Widget _buildLoader() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  _buildBody() {
    return FutureBuilder<GithubModel>(
        future: repository.fecthGithub(),
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
            SizedBox(
              height: 200,
              width: 200,
              child: CircleAvatar(
                backgroundImage: NetworkImage(model.avatarUrl),
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
              style: const TextStyle(fontSize: 18),
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
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.public),
              label: Text(
                'Publicações: ${model.publicRepos.toString()}',
                style: const TextStyle(color: Colors.black, fontSize: 18),
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
