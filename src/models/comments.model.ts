// posts-model.ts - A mongoose model
//
// See http://mongoosejs.com/docs/models.html
// for more of what you can do here.
import { getModel, model, ModelTypes, Schema } from 'ottoman';
import { ModelOptions } from 'ottoman/lib/types/model/interfaces/create-model.interface';
import { Application } from '../declarations';
import baseSchema from './base.schema';

export default function (app: Application): ModelTypes {
  const modelName = 'comments';
  const modelOptions: ModelOptions = {
    scopeName: 'commentscope',
    collectionName: 'commentcollection',
  };

  const schema = new Schema({
    review: {
      type: String,
      required: true,
    },
    post: {
      type: String,
      ref: 'posts',
    },
  }).add(baseSchema);

  return getModel(modelName) || model(modelName, schema, modelOptions);
}
