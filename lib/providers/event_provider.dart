import 'package:events_app/services/event_service.dart';
import 'package:flutter/material.dart';

import '../models/event_model.dart';

class EventProvider with ChangeNotifier {

  List<EventModel> _eventModels = [];
  bool _isLoading = false;

  List<EventModel> get eventModels => _eventModels;
  bool get isLoading => _isLoading;

  Future<void> getListEvents() async {
    _isLoading = true;
    try{
      Map<String, dynamic> result = await EventService().getEvents();
      _eventModels = result["data"]
            .map<EventModel>((data) => EventModel.fromJson(data))
            .toList();
      print(_eventModels.length);
    }catch(e){
      print(e);
    }
    _isLoading = false;
    notifyListeners();
  }
}