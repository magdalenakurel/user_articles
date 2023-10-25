// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthorModelImpl _$$AuthorModelImplFromJson(Map<String, dynamic> json) =>
    _$AuthorModelImpl(
      json['id'] as int,
      json['picture'] as String,
      json['first_name'] as String,
      json['last_name'] as String,
    );

Map<String, dynamic> _$$AuthorModelImplToJson(_$AuthorModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'picture': instance.picture,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
    };
