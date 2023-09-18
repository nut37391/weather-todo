// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_list_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DataListAdapter extends TypeAdapter<DataList> {
  @override
  final int typeId = 0;

  @override
  DataList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DataList()..city = (fields[0] as List).cast<String>();
  }

  @override
  void write(BinaryWriter writer, DataList obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.city);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
