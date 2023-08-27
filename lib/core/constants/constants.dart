// ignore_for_file: constant_identifier_names

//Api Call
import 'package:flutter/material.dart';

const String BASE_URL = 'https://mvvvip1.defas-fgi.de';
const String PATH =
    '/mvv/XML_STOPFINDER_REQUEST?language=de&outputFormat=RapidJSON&type_sf=any&name_sf=';

//General
const String APP_NAME = 'Fahrplanauskunfts';

//Search Screen
const String HOME_SCREEN_TITLE = 'Startpunkt Finden';
const String HOME_SCREEN_SEARCH_TEXT = 'Suche eingeben';
const String SEARCHED_TEXT_NOT_FOUND =
    'Es konnten keine Treffer gefunden werden. Bitte versuchen Sie einen anderen Suchtext.';

//Details Screen
const String COORDINATES = 'Coordinates';

//Error Dialog
const String DIALOG_TITLE = 'Fehler';
const String CONNECTION_ERROR = 'Bitte überprüfen Sie Ihre Internetverbindung.';
const String TIMEOUT_ERROR = 'Es ist ein Timeout-Fehler aufgetreten.';
const String UNKNOWN_ERROR = 'Unbekannter Fehler aufgetreten.';

//Routes
const String HOME_SCREEN = '/HomeScreen';
const String DETAILS_SCREEN = '/DetailsScreen';

//Colors
const Color COLOR_PURPLE = Color(0xFF7B73E7);
