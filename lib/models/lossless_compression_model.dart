class LosslessCompressionModel {
  Analysis? analysis;
  List<Compression>? compressions;
  String? bestAlgorithm;

  LosslessCompressionModel.fromJson(Map<String, dynamic> json) {
    analysis =
        json['analysis'] != null ? Analysis.fromJson(json['analysis']) : null;
    if (json['compressions'] != null) {
      compressions = <Compression>[];
      json['compressions'].forEach((v) {
        compressions!.add(Compression.fromJson(v));
      });
    }
    bestAlgorithm = json['best_algorithm'];
  }
}

class Analysis {
  Map<String, dynamic>? probabilities;
  double? entropy;
  int? bits;

  Analysis.fromJson(Map<String, dynamic> json) {
    probabilities = json['probabilities'];
    entropy = json['entropy'];
    bits = json['bits'];
  }
}

class Compression {
  String? name;
  String? encodedMessage;
  int? bitsAfterCompression;
  double? compressionRatio;
  double? averageLength;
  double? efficiency;
  double? encodedValue;
  int? n;
  int? m;
  String? golombEncoded;
  int? bitsBeforeCompression;

  Compression(
      {this.name,
      this.encodedMessage,
      this.bitsAfterCompression,
      this.compressionRatio,
      this.averageLength,
      this.efficiency,
      this.encodedValue,
      this.n,
      this.m,
      this.golombEncoded,
      this.bitsBeforeCompression});

  Compression.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    encodedMessage = json['encoded_message'];
    bitsAfterCompression = json['bits_after_compression'];
    compressionRatio = json['compression_ratio'];
    averageLength = json['average_length'];
    efficiency = json['efficiency'];
    encodedValue = json['encoded_value'];
    n = json['n'];
    m = json['m'];
    golombEncoded = json['golomb_encoded'];
    bitsBeforeCompression = json['bits_before_compression'];
  }
}
