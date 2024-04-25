class AnalysisModel {
  Map<String, double>? probabilityOfOccurrence;
  int? bitsBeforeEncoding;
  double? entropy;
  double? averageLength;

  AnalysisModel({
    this.probabilityOfOccurrence,
    this.bitsBeforeEncoding,
    this.entropy,
    this.averageLength,
  });

  AnalysisModel.fromJson(Map<String, dynamic> json) {
    probabilityOfOccurrence = json['probability_of_occurrence'];
    bitsBeforeEncoding = json['bits_before_encoding'];
    entropy = json['entropy'];
    averageLength = json['average_length'];
  }
}
