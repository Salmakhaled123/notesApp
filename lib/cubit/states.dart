abstract class AppCubitStates {}
class AppCubitInitialState extends AppCubitStates{}
class NotesAppDbCreation extends AppCubitStates{}
class NotesLoadingInsertion extends AppCubitStates{}
class NotesInsertionSuccessfully extends AppCubitStates{}
class NotesInsertionError extends AppCubitStates{}
class NotesLoadingGetDataFromDb extends AppCubitStates{}
class NotesSuccessGetDataFromDb extends AppCubitStates{}
class NotesErrorGetDataFromDb extends AppCubitStates{}
class NotesUpdateDbSuccessfully extends AppCubitStates{}
class ErrorInNotesInUpdateDb extends AppCubitStates{}
class SuccessInDeletionFromDb extends AppCubitStates{}
class ErrorInDeletionFromDb extends AppCubitStates{}
class ErrorInDeletionAllQueries extends AppCubitStates{}
class SuccessInDeletionAllQueries extends AppCubitStates{}

