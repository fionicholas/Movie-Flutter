// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crew.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultCrew _$ResultCrewFromJson(Map<String, dynamic> json) {
  return ResultCrew(
    (json['cast'] as List)
        ?.map(
            (e) => e == null ? null : Crew.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ResultCrewToJson(ResultCrew instance) =>
    <String, dynamic>{
      'cast': instance.crew,
    };

Crew _$CrewFromJson(Map<String, dynamic> json) {
  return Crew(
    json['name'] as String,
    json['character'] as String,
    json['profile_path'] as String,
  );
}

Map<String, dynamic> _$CrewToJson(Crew instance) => <String, dynamic>{
      'name': instance.realName,
      'character': instance.characterName,
      'profile_path': instance.profile,
    };
