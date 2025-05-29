
import '../response/sub_models/add_material.dart';
import '../response/sub_models/add_visitor_model.dart';

class AddVisitPermitBody {
  String? visitDate;
  String? sectorId;
  String? villaId;
  String? beachId;
  String? daysCount;
  String? status;
  String? driverName;
  String? visitorsSwitch;
  String? materialsSwitch;
  String? note;
  String? phone;
  List<AddVisitor>? visitor;
  List<AddMaterial>? material;
  bool? sendClient;
  bool? sendProvider;


  AddVisitPermitBody({
    this.visitDate,
    this.sectorId,
    this.villaId,
    this.beachId,
    this.daysCount,
    this.status,
    this.driverName,
    this.visitorsSwitch,
    this.materialsSwitch,
    this.note,
    this.phone,
    this.visitor,
    this.material,
    this.sendClient,
    this.sendProvider,

  });


  Map<String, dynamic> toJson() => {
    "visit_date": visitDate,
    "sector_id": sectorId,
    "villa_id": villaId,
    "beach_id": beachId,
    "days_count": daysCount,
    "status": status,
    "driver_name": driverName,
    "visitors_switch": visitorsSwitch,
    "materials_switch": materialsSwitch,
    "note": note,
    "phone": phone,
    "send_client": sendClient,
    "send_provider": sendProvider,
    "visitors": visitor == null ? [] : List<dynamic>.from(visitor!.map((x) => x.toJson())),
    "materials": material == null ? [] : List<dynamic>.from(material!.map((x) => x.toJson())),
  };
}
