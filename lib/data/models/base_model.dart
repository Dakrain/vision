abstract class BaseModel<Model, Entity> {
  Entity toEntity();
  Model fromEntity();
}
