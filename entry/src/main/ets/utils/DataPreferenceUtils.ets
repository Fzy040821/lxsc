import { preferences } from '@kit.ArkData'

let context = getContext(this)
let dataPreferences :preferences.Preferences|null = null
/**
 * dataPreference存储封装
 */
export class DataPreferencesUtils{

  //初始化
  static async createDataPreference(){
    dataPreferences = await preferences.getPreferences(context , 'data.preference')
  }

  //删除
  static async deleteDataPreference(){
    await preferences.deletePreferences(context , 'data.preference')
    dataPreferences = null
  }

  //存储
  static async putDataPreference(key: string , value: string){
    if(dataPreferences!=null){
      await DataPreferencesUtils.createDataPreference()
    }
    await dataPreferences?.put(key , value)
    await dataPreferences?.flush()
  }

  //读取
  static async getDataPreference(key: string){
    if(dataPreferences!=null){
      await DataPreferencesUtils.createDataPreference()
    }
    let value = (await dataPreferences!.get(key , '')).toString()
   return value
  }

}