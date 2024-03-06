import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:HelpingHand/Contact/ContactPage.dart';
import 'package:HelpingHand/Home/HomePage.dart';
import 'package:HelpingHand/ActivePage/Main_Wrapper.dart';
import 'package:HelpingHand/Profile/ProfilePage.dart';
import 'package:HelpingHand/Profile/EditProfilePage.dart';
import 'package:HelpingHand/Contact/AddContactPage.dart';

class AppNavigation {
  AppNavigation._();

  static String initR = '/Home';

  //Private navigatiors keys
  static final _rootNavigatiorKey = GlobalKey<NavigatorState>();
  static final _rootNavigatiorHome = GlobalKey<NavigatorState>(debugLabel: 'ShelHome');
  static final _rootNavigatiorAddContact = GlobalKey<NavigatorState>(debugLabel: 'ShelAddCT');
  static final _rootNavigatiorProfile = GlobalKey<NavigatorState>(debugLabel: 'ShelProfile');



  //go router configuration


  static final GoRouter router = GoRouter(
    initialLocation: initR,
    navigatorKey:_rootNavigatiorKey,
    routes: <RouteBase>[

      //Mainwrapper router
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => MainWrapper(navigationShell: navigationShell),
          branches: <StatefulShellBranch>[


            //branch home
            StatefulShellBranch(
              navigatorKey: _rootNavigatiorHome,
              routes: [
                GoRoute(
                  path: '/Home',
                  name: 'Hompage',
                  parentNavigatorKey: _rootNavigatiorHome,
                  builder: (context, state){
                    return HomePage(
                      key: state.pageKey,
                    );
                  }
                )
              ],
            ),
            //branch add contact
            //brach home
            StatefulShellBranch(
              navigatorKey: _rootNavigatiorAddContact,
              routes: [
                GoRoute(
                    path: '/Contact',
                    name: 'AddContact',
                    builder: (context, state){
                      return ContactPage(
                        key: state.pageKey,
                      );
                    },
                    routes: [
                      /// edit profile
                      GoRoute(
                          path: 'subContact',
                          name: 'SubAddContact',
                          builder: (context, state) {
                            return AddContact(
                              key: state.pageKey,
                            );
                          })]
                )
              ],
            ),


            //brach AddContact
            StatefulShellBranch(
              navigatorKey: _rootNavigatiorProfile,
              routes: [
                GoRoute(
                    path: '/Profile',
                    name: 'Profile',
                    builder: (context, state){
                      return Profile(
                        key: state.pageKey,
                      );
                    },
                    routes: [
                    /// edit profile
                    GoRoute(
                    path: 'subProFile',
                    name: 'EditProFile',
                    builder: (context, state) {
                      return EditProfile(
                        key: state.pageKey,
                      );
                    })]

                )
              ],
            )
          ],
      )


    ],
  );
}