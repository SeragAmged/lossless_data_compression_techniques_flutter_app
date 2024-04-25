class CompressionsModel {
  List<Technique>? techniques;
  String? recommendation;

  CompressionsModel({
    this.techniques,
    this.recommendation,
  });
  CompressionsModel.fromJson(Map<String, dynamic> json) {
    techniques = json['techniques'].forEach((v) {
      techniques!.add(Technique.fromJson(v));
    });
    recommendation = json['recommendation'];
  }
}

class Technique {
  String? name;
  double? bitsAfterEncoding;
  double? compressionRatio;
  double? efficiency;

  Technique({
    this.name,
    this.bitsAfterEncoding,
    this.compressionRatio,
    this.efficiency,
  });

  Technique.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    bitsAfterEncoding = json['bits_after_encoding'];
    compressionRatio = json['compression_ratio'];
    efficiency = json['efficiency'];
  }
}
