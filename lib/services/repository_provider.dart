import 'repository.dart';

//This class is intended to provide a global read access
// to the repository class.
class RepositoryProvider {
  Repository provideRepository() => Repository();
}
