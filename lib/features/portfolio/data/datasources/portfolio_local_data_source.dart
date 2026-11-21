/// Local source of truth. Edit the data here, nothing else needs to change.
/// TODO: fix the descriptions and add `url` for each project.
class PortfolioLocalDataSource {
  const PortfolioLocalDataSource();

  Future<Map<String, dynamic>> fetchProfile() async => const {
        'name': 'Ahmed',
        'headline': 'Flutter and Dart developer in Cairo.',
        'intro':
            'I build mobile apps that are quick to use and simple to read. Have a look at what I have shipped.',
        'about':
            'I studied in the Autotronics Technology Program at New Cairo Technological University, and now I focus on mobile development with Flutter and Dart. I like small, fast apps that do one job well.',
        'githubUrl': 'https://github.com/badri784',
        'linkedinUrl': 'https://www.linkedin.com/in/ahmed-salah6',
      };

  Future<List<Map<String, dynamic>>> fetchProjects() async => const [
        {
          'name': 'Pray in Time',
          'description': 'Prayer times app. Published on APKPure.',
          'stack': ['Flutter', 'Dart'],
          'accent': 0xFF0B5D4B,
        },
        {
          'name': 'ChefMate',
          'description': 'A recipe companion for planning what to cook.',
          'stack': ['Flutter', 'Dart'],
          'accent': 0xFFC2410C,
        },
        {
          'name': 'Rick & Morty Explorer',
          'description': 'Browse characters from the show through a public API.',
          'stack': ['Flutter', 'REST API'],
          'accent': 0xFF2563EB,
        },
        {
          'name': 'Expenses Tracker',
          'description': 'Log what you spend and see where the money goes.',
          'stack': ['Flutter', 'Dart'],
          'accent': 0xFF0F766E,
        },
        {
          'name': 'To-Do App',
          'description': 'A simple task list for daily planning.',
          'stack': ['Flutter', 'Dart'],
          'accent': 0xFF7C3AED,
        },
        {
          'name': 'Digital Tasbeeh',
          'description': 'A digital counter for daily dhikr.',
          'stack': ['Flutter', 'Dart'],
          'accent': 0xFF92400E,
        },
        {
          'name': "Mo'men",
          'description': 'Add a short description here.',
          'stack': ['Flutter', 'Dart'],
          'accent': 0xFF334155,
        },
      ];
}
