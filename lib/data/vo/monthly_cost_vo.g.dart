// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monthly_cost_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MonthlyCostVOAdapter extends TypeAdapter<MonthlyCostVO> {
  @override
  final int typeId = 2;

  @override
  MonthlyCostVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MonthlyCostVO(
      total: fields[0] as double,
      electricBill: fields[1] as double,
      waterBill: fields[2] as double,
      internetBill: fields[3] as double,
      dailyCosts: (fields[4] as Map).cast<String, double>(),
    );
  }

  @override
  void write(BinaryWriter writer, MonthlyCostVO obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.total)
      ..writeByte(1)
      ..write(obj.electricBill)
      ..writeByte(2)
      ..write(obj.waterBill)
      ..writeByte(3)
      ..write(obj.internetBill)
      ..writeByte(4)
      ..write(obj.dailyCosts);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MonthlyCostVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
