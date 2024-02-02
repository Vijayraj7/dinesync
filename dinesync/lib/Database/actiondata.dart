import 'dart:convert';
import 'dart:math';

// import 'package:flutter/foundation.dart';
import 'package:dinesync/Database/dataposting.dart';

class ActionSchools {
  static String from = (Random().nextInt(3434778) + 1432778).toString();

  static String checktable(String dName, String tablename) {
    String query = '''


date_default_timezone_set('Asia/Kolkata');
  if (!Schema::connection('$dName')->hasTable('$tablename')) {

Schema::connection('$dName')->create('$tablename', function(\$table)
{
    \$table->id()->from($from);
    \$table->timestamp('created_at')->useCurrent();
    \$table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate();
});

  }


''';
    return query;
    // await postquery(query);
  }

  static String getableall(String dName, String tablename) {
    String query = '''


date_default_timezone_set('Asia/Kolkata');
  if (!Schema::connection('$dName')->hasTable('$tablename')) {

         return 'f';

  }else{
    \$names =  DB::connection('$dName')->table('$tablename')->get();
    return json_encode(\$names);
  }


''';
    return query;
    // await postquery(query);
  }

  static String getablealldupebycol(
      String col, String dName, String tablename) {
    String query = '''


date_default_timezone_set('Asia/Kolkata');
  if (!Schema::connection('$dName')->hasTable('$tablename')) {

         return 'f';

  }else{
    \$names =  DB::connection('$dName')->table('$tablename')->select('$col')->get();
    \$name = [];
foreach(\$names as \$use) {
    \$name[] = \$use->$col;
}
    return json_encode(array_values(array_unique(\$name)));
  }


''';
    return query;
    // await postquery(query);
  }

  static String getableallbydistance(String dName, String tablename,
      double clat, double clng, double distance) {
    String query = '''


date_default_timezone_set('Asia/Kolkata');
  if (!Schema::connection('$dName')->hasTable('$tablename')) {

         return 'f';

  }else{
   \$latitude = $clat;
   \$longitude = $clng;
       
        \$haversine = "(
    6371 * acos(
        cos(radians(" .\$latitude. "))
        * cos(radians(`lat`))
        * cos(radians(`lng`) - radians(" .\$longitude. "))
        + sin(radians(" .\$latitude. ")) * sin(radians(`lat`))
    )
)";

 \$names =  DB::connection('$dName')->table('$tablename')
    ->select("*")
    ->selectRaw("\$haversine AS distance")
    ->having("distance", "<=", $distance)
    ->orderby("distance", "desc")
    ->get();

    return json_encode(\$names);
  }


''';
    return query;
    // await postquery(query);
  }

  static String getableallbydistanceby(Map data, String dName, String tablename,
      double clat, double clng, double distance) {
    String query = '''


          // \$rr =   DB::connection('schoolurl')->table('schools')->get();
          // return \$rr;


date_default_timezone_set('Asia/Kolkata');
   \$latitude = $clat;
   \$longitude = $clng;
       
        \$haversine = "(
    6371 * acos(
        cos(radians(" .\$latitude. "))
        * cos(radians(`lat`))
        * cos(radians(`lng`) - radians(" .\$longitude. "))
        + sin(radians(" .\$latitude. ")) * sin(radians(`lat`))
    )
)";
  if (!Schema::connection('$dName')->hasTable('$tablename')) {

         return 'f';

  }else{''';
    data.forEach((key, value) {
      query += '''
     if (!Schema::connection('$dName')->hasColumn('$tablename', '$key')) {
	      return '[]';
      } ''';
    });
    query += '''
    if(!DB::connection('$dName')->table('$tablename')->where(function(\$query) {\$query''';
    data.forEach((key, value) {
      query += '''->orWhere('$key', 'LIKE', '%'.'$value'.'%')''';
    });
    query += ''';})->exists()){
      return '[]';
    }else{

      \$names = DB::connection('$dName')->table('$tablename')->where(function(\$query) {\$query''';
    data.forEach((key, value) {
      query += '''->orWhere('$key', 'LIKE', '%'.'$value'.'%')''';
    });
    query += ''';})->select("*")
    ->selectRaw("\$haversine AS distance")
    ->having("distance", "<=", $distance)
    ->orderby("distance", "desc")
    ->get(); 
//        \$dt = [];
//                 foreach (\$names as \$name) {
//                   if (is_object(json_decode(\$name))) 
// { 
// array_push(\$dt, json_decode(\$name, true));
// }else{
// array_push(\$dt, \$name);
// }
//             }
      return json_encode(\$names);
      
    }
  }




''';
    return query;
    // await postquery(query);
  }

  static String getallby(String dName, String tablename, Map data) {
    String query = '''


          // \$rr =   DB::connection('schoolurl')->table('schools')->get();
          // return \$rr;
  if (!Schema::connection('$dName')->hasTable('$tablename')) {

         return 'f';

  }else{''';
    data.forEach((key, value) {
      query += '''
     if (!Schema::connection('$dName')->hasColumn('$tablename', '$key')) {
	      return '[]';
      } ''';
    });
    query += '''
    if(!DB::connection('$dName')->table('$tablename')->where(function(\$query) {\$query''';
    data.forEach((key, value) {
      query += '''->orWhere('$key', '$value')''';
    });
    query += ''';})->exists()){
      return '[]';
    }else{

      \$names = DB::connection('$dName')->table('$tablename')->where(function(\$query) {\$query''';
    data.forEach((key, value) {
      query += '''->orWhere('$key', '$value')''';
    });
    query += ''';})->get(); 
//        \$dt = [];
//                 foreach (\$names as \$name) {
//                   if (is_object(json_decode(\$name))) 
// { 
// array_push(\$dt, json_decode(\$name, true));
// }else{
// array_push(\$dt, \$name);
// }
//             }
      return json_encode(\$names);
      
    }
  }



''';
    return query;
    // await postquery(query);
  }

  static String getallbyoder(
      String dName, String tablename, Map data, String orderstr) {
    String query = '''


          // \$rr =   DB::connection('schoolurl')->table('schools')->get();
          // return \$rr;
  if (!Schema::connection('$dName')->hasTable('$tablename')) {

         return 'f';

  }else{''';
    data.forEach((key, value) {
      query += '''
     if (!Schema::connection('$dName')->hasColumn('$tablename', '$key')) {
	      return '[]';
      } ''';
    });
    query += '''
    if(!DB::connection('$dName')->table('$tablename')->where(function(\$query) {\$query''';
    data.forEach((key, value) {
      query += '''->where('$key', '$value')''';
    });
    query += ''';})->exists()){
      return '[]';
    }else{

      \$names = DB::connection('$dName')->table('$tablename')->where(function(\$query) {\$query''';
    data.forEach((key, value) {
      query += '''->where('$key', '$value')''';
    });
    query += ''';})->orderBy('$orderstr','desc')->get(); 
//        \$dt = [];
//                 foreach (\$names as \$name) {
//                   if (is_object(json_decode(\$name))) 
// { 
// array_push(\$dt, json_decode(\$name, true));
// }else{
// array_push(\$dt, \$name);
// }
//             }
      return json_encode(\$names);
      
    }
  }



''';
    return query;
    // await postquery(query);
  }

  static String getallbyodercount(
      int limit, String dName, String tablename, Map data, String orderstr) {
    String query = '''


          // \$rr =   DB::connection('schoolurl')->table('schools')->get();
          // return \$rr;
  if (!Schema::connection('$dName')->hasTable('$tablename')) {

         return 'f';

  }else{''';
    data.forEach((key, value) {
      query += '''
     if (!Schema::connection('$dName')->hasColumn('$tablename', '$key')) {
	      return '[]';
      } ''';
    });
    query += '''
    if(!DB::connection('$dName')->table('$tablename')->where(function(\$query) {\$query''';
    data.forEach((key, value) {
      query += '''->where('$key', '$value')''';
    });
    query += ''';})->exists()){
      return '[]';
    }else{

      \$names = DB::connection('$dName')->table('$tablename')->where(function(\$query) {\$query''';
    data.forEach((key, value) {
      query += '''->where('$key', '$value')''';
    });
    query += ''';})->orderBy('$orderstr','desc')->limit($limit)->get(); 
//        \$dt = [];
//                 foreach (\$names as \$name) {
//                   if (is_object(json_decode(\$name))) 
// { 
// array_push(\$dt, json_decode(\$name, true));
// }else{
// array_push(\$dt, \$name);
// }
//             }
      return json_encode(\$names);
      
    }
  }



''';
    return query;
    // await postquery(query);
  }

  static String getallbyoderkeyrev(
      String dName, String tablename, Map data, String orderstr) {
    String query = '''


          // \$rr =   DB::connection('schoolurl')->table('schools')->get();
          // return \$rr;
  if (!Schema::connection('$dName')->hasTable('$tablename')) {

         return 'f';

  }else{''';
    data.forEach((value, key) {
      query += '''
     if (!Schema::connection('$dName')->hasColumn('$tablename', '$key')) {
	      return '[]';
      } ''';
    });
    query += '''
    if(!DB::connection('$dName')->table('$tablename')->where(function(\$query) {\$query''';
    data.forEach((value, key) {
      query += '''->orWhere('$key', '$value')''';
    });
    query += ''';})->exists()){
      return '[]';
    }else{

      \$names = DB::connection('$dName')->table('$tablename')->where(function(\$query) {\$query''';
    data.forEach((value, key) {
      query += '''->orWhere('$key', '$value')''';
    });
    query += ''';})->orderBy('$orderstr','desc')->get(); 
//        \$dt = [];
//                 foreach (\$names as \$name) {
//                   if (is_object(json_decode(\$name))) 
// { 
// array_push(\$dt, json_decode(\$name, true));
// }else{
// array_push(\$dt, \$name);
// }
//             }
      return json_encode(\$names);
      
    }
  }



''';
    return query;
    // await postquery(query);
  }

  static String getallbystrict(String dName, String tablename, Map data) {
    String query = '''


          // \$rr =   DB::connection('schoolurl')->table('schools')->get();
          // return \$rr;
  if (!Schema::connection('$dName')->hasTable('$tablename')) {

         return 'f';

  }else{''';
    data.forEach((key, value) {
      query += '''
     if (!Schema::connection('$dName')->hasColumn('$tablename', '$key')) {
	      return '[]';
      } ''';
    });
    query += '''
    if(!DB::connection('$dName')->table('$tablename')->where(function(\$query) {\$query''';
    data.forEach((key, value) {
      query += '''->where('$key', '$value')''';
    });
    query += ''';})->exists()){
      return '[]';
    }else{

      \$names = DB::connection('$dName')->table('$tablename')->where(function(\$query) {\$query''';
    data.forEach((key, value) {
      query += '''->where('$key', '$value')''';
    });
    query += ''';})->get(); 
//        \$dt = [];
//                 foreach (\$names as \$name) {
//                   if (is_object(json_decode(\$name))) 
// { 
// array_push(\$dt, json_decode(\$name, true));
// }else{
// array_push(\$dt, \$name);
// }
//             }
      return json_encode(\$names);
      
    }
  }



''';
    return query;
    // await postquery(query);
  }

  static String getallbyrandom(
      String dName, String tablename, Map data, int limit) {
    String query = '''


          // \$rr =   DB::connection('schoolurl')->table('schools')->get();
          // return \$rr;
  if (!Schema::connection('$dName')->hasTable('$tablename')) {

         return 'f';

  }else{''';
    data.forEach((key, value) {
      query += '''
     if (!Schema::connection('$dName')->hasColumn('$tablename', '$key')) {
	      return '[]';
      } ''';
    });
    query += '''
    if(!DB::connection('$dName')->table('$tablename')->where(function(\$query) {\$query''';
    data.forEach((key, value) {
      query += '''->orWhere('$key', '$value')''';
    });
    query += ''';})->exists()){
      return '[]';
    }else{

      \$names = DB::connection('$dName')->table('$tablename')->where(function(\$query) {\$query''';
    data.forEach((key, value) {
      query += '''->orWhere('$key', '$value')''';
    });
    query += ''';})->inRandomOrder()->limit($limit)->get(); 
//        \$dt = [];
//                 foreach (\$names as \$name) {
//                   if (is_object(json_decode(\$name))) 
// { 
// array_push(\$dt, json_decode(\$name, true));
// }else{
// array_push(\$dt, \$name);
// }
//             }
      return json_encode(\$names);
      
    }
  }



''';
    return query;
    // await postquery(query);
  }

  static String getallbyrandomwithoutdata(
      String dName, String tablename, Map v, int limit) {
    String query = '''


          // \$rr =   DB::connection('schoolurl')->table('schools')->get();
          // return \$rr;
  if (!Schema::connection('$dName')->hasTable('$tablename')) {

         return 'f';

  }else{''';

    query += '''
  

      \$names = DB::connection('$dName')->table('$tablename')->inRandomOrder()->limit($limit)->get(); 
//        \$dt = [];
//                 foreach (\$names as \$name) {
//                   if (is_object(json_decode(\$name))) 
// { 
// array_push(\$dt, json_decode(\$name, true));
// }else{
// array_push(\$dt, \$name);
// }
//             }
      return json_encode(\$names);
      
    
  }



''';
    return query;
    // await postquery(query);
  }

  static String getallbyrandomwithoutdatakeyrev(
      String dName, String tablename, int limit) {
    String query = '''


          // \$rr =   DB::connection('schoolurl')->table('schools')->get();
          // return \$rr;
  if (!Schema::connection('$dName')->hasTable('$tablename')) {

         return 'f';

  }else{''';

    query += '''
  

      \$names = DB::connection('$dName')->table('$tablename')->inRandomOrder()->limit($limit)->get(); 
//        \$dt = [];
//                 foreach (\$names as \$name) {
//                   if (is_object(json_decode(\$name))) 
// { 
// array_push(\$dt, json_decode(\$name, true));
// }else{
// array_push(\$dt, \$name);
// }
//             }
      return json_encode(\$names);
      
    
  }



''';
    return query;
    // await postquery(query);
  }

  static String getallbyrandomorderby(
      String dName, String tablename, Map data, int limit, String order) {
    String query = '''


          // \$rr =   DB::connection('schoolurl')->table('schools')->get();
          // return \$rr;
  if (!Schema::connection('$dName')->hasTable('$tablename')) {

         return 'f';

  }else{''';
    data.forEach((key, value) {
      query += '''
     if (!Schema::connection('$dName')->hasColumn('$tablename', '$key')) {
	      return '[]';
      } ''';
    });
    query += '''
    if(!DB::connection('$dName')->table('$tablename')->where(function(\$query) {\$query''';
    data.forEach((key, value) {
      query += '''->orWhere('$key', '$value')''';
    });
    query += ''';})->exists()){
      return '[]';
    }else{

      \$names = DB::connection('$dName')->table('$tablename')->where(function(\$query) {\$query''';
    data.forEach((key, value) {
      query += '''->orWhere('$key', '$value')''';
    });
    query +=
        ''';})->orderByRaw('CHAR_LENGTH($order)')->inRandomOrder()->limit($limit)->get()->shuffle(); 
//        \$dt = [];
//                 foreach (\$names as \$name) {
//                   if (is_object(json_decode(\$name))) 
// { 
// array_push(\$dt, json_decode(\$name, true));
// }else{
// array_push(\$dt, \$name);
// }
//             }
      return json_encode(\$names);
      
    }
  }



''';
    return query;
    // await postquery(query);
  }

  static String getallbyrandomorderbykeyrev(
      String dName, String tablename, Map data, int limit, String order) {
    String query = '''


          // \$rr =   DB::connection('schoolurl')->table('schools')->get();
          // return \$rr;
  if (!Schema::connection('$dName')->hasTable('$tablename')) {

         return 'f';

  }else{''';
    data.forEach((value, key) {
      query += '''
     if (!Schema::connection('$dName')->hasColumn('$tablename', '$key')) {
	      return '[]';
      } ''';
    });
    query += '''
    if(!DB::connection('$dName')->table('$tablename')->where(function(\$query) {\$query''';
    data.forEach((value, key) {
      query += '''->orWhere('$key', '$value')''';
    });
    query += ''';})->exists()){
      return '[]';
    }else{

      \$names = DB::connection('$dName')->table('$tablename')->where(function(\$query) {\$query''';
    data.forEach((value, key) {
      query += '''->orWhere('$key', '$value')''';
    });
    query +=
        ''';})->orderByRaw('CHAR_LENGTH($order)')->inRandomOrder()->limit($limit)->get()->shuffle(); 
//        \$dt = [];
//                 foreach (\$names as \$name) {
//                   if (is_object(json_decode(\$name))) 
// { 
// array_push(\$dt, json_decode(\$name, true));
// }else{
// array_push(\$dt, \$name);
// }
//             }
      return json_encode(\$names);
      
    }
  }



''';
    return query;
    // await postquery(query);
  }

  static String getallbylike(String dName, String tablename, Map data) {
    String query = '''


          // \$rr =   DB::connection('schoolurl')->table('schools')->get();
          // return \$rr;
  if (!Schema::connection('$dName')->hasTable('$tablename')) {

         return 'f';

  }else{''';
    data.forEach((key, value) {
      query += '''
     if (!Schema::connection('$dName')->hasColumn('$tablename', '$key')) {
	      return '[]';
      } ''';
    });
    query += '''
    if(!DB::connection('$dName')->table('$tablename')->where(function(\$query) {\$query''';
    data.forEach((key, value) {
      query += '''->orWhere('$key', 'LIKE', '%'.'$value'.'%')''';
    });
    query += ''';})->exists()){
      return '[]';
    }else{

      \$names = DB::connection('$dName')->table('$tablename')->where(function(\$query) {\$query''';
    data.forEach((key, value) {
      query += '''->orWhere('$key', 'LIKE', '%'.'$value'.'%')''';
    });
    query += ''';})->get(); 
//        \$dt = [];
//                 foreach (\$names as \$name) {
//                   if (is_object(json_decode(\$name))) 
// { 
// array_push(\$dt, json_decode(\$name, true));
// }else{
// array_push(\$dt, \$name);
// }
//             }
      return json_encode(\$names);
      
    }
  }



''';
    return query;
    // await postquery(query);
  }

  static String getallbylikerev(String dName, String tablename, Map data) {
    String query = '''


          // \$rr =   DB::connection('schoolurl')->table('schools')->get();
          // return \$rr;
  if (!Schema::connection('$dName')->hasTable('$tablename')) {

         return 'f';

  }else{''';
    data.forEach((value, key) {
      query += '''
     if (!Schema::connection('$dName')->hasColumn('$tablename', '$key')) {
	      return '[]';
      } ''';
    });
    query += '''
    if(!DB::connection('$dName')->table('$tablename')->where(function(\$query) {\$query''';
    data.forEach((value, key) {
      query += '''->orWhere('$key', 'LIKE', '%'.'$value'.'%')''';
    });
    query += ''';})->exists()){
      return '[]';
    }else{

      \$names = DB::connection('$dName')->table('$tablename')->where(function(\$query) {\$query''';
    data.forEach((value, key) {
      query += '''->orWhere('$key', 'LIKE', '%'.'$value'.'%')''';
    });
    query += ''';})->get(); 
//        \$dt = [];
//                 foreach (\$names as \$name) {
//                   if (is_object(json_decode(\$name))) 
// { 
// array_push(\$dt, json_decode(\$name, true));
// }else{
// array_push(\$dt, \$name);
// }
//             }
      return json_encode(\$names);
      
    }
  }



''';
    return query;
    // await postquery(query);
  }

  static String getallbylikecountrandom(
      String dName, String tablename, Map data, int limit) {
    String query = '''


          // \$rr =   DB::connection('schoolurl')->table('schools')->get();
          // return \$rr;
  if (!Schema::connection('$dName')->hasTable('$tablename')) {

         return 'f';

  }else{''';
    data.forEach((key, value) {
      query += '''
     if (!Schema::connection('$dName')->hasColumn('$tablename', '$key')) {
	      return '[]';
      } ''';
    });
    query += '''
    if(!DB::connection('$dName')->table('$tablename')->where(function(\$query) {\$query''';
    data.forEach((key, value) {
      query += '''->orWhere('$key', 'LIKE', '%'.'$value'.'%')''';
    });
    query += ''';})->exists()){
      return '[]';
    }else{

      \$names = DB::connection('$dName')->table('$tablename')->where(function(\$query) {\$query''';
    data.forEach((key, value) {
      query += '''->orWhere('$key', 'LIKE', '%'.'$value'.'%')''';
    });
    query += ''';})->inRandomOrder()->limit($limit)->get(); 
//        \$dt = [];
//                 foreach (\$names as \$name) {
//                   if (is_object(json_decode(\$name))) 
// { 
// array_push(\$dt, json_decode(\$name, true));
// }else{
// array_push(\$dt, \$name);
// }
//             }
      return json_encode(\$names);
      
    }
  }



''';
    return query;
    // await postquery(query);
  }

  static String getoneby(String dName, String tablename, Map data) {
    String query = '''


  if (!Schema::connection('$dName')->hasTable('$tablename')) {

         return '{}';

  }else{''';
    data.forEach((key, value) {
      query += '''
     if (!Schema::connection('$dName')->hasColumn('$tablename', '$key')) {
	      return '{}';
      } ''';
    });
    query += '''
    if(!DB::connection('$dName')->table('$tablename')->where(function(\$query) {\$query''';
    data.forEach((key, value) {
      query += '''->where('$key', '$value')''';
    });
    query += ''';})->exists()){
      return '{}';
    }else{

      \$rr = DB::connection('$dName')->table('$tablename')->where(function(\$query) {\$query''';
    data.forEach((key, value) {
      query += '''->where('$key', '$value')''';
    });
    query += ''';})->first();
      return json_encode(\$rr);
      
    }
  }



''';
    return query;
    // await postquery(query);
  }

  static String settable(
      String dName, String tablename, Map data, String ke, String valu) {
    // Map data = json.decode(json.encode(dat));
    String query = '''


date_default_timezone_set('Asia/Kolkata');
\$dat = date('Y-m-d H:i:s');
  if (!Schema::connection('$dName')->hasTable('$tablename')) {

Schema::connection('$dName')->create('$tablename', function(\$table)
{
    \$table->id()->from($from);
    \$table->timestamp('created_at')->useCurrent();
    \$table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate();
});

  }
   Schema::connection('$dName')->table('$tablename', function (\$table) {
  ''';
    data.forEach((key, value) {
      query += '''
 if (!Schema::connection('$dName')->hasColumn('$tablename', '$key')) {
  ''';
      if (key == 'uid') {
        query += '''
	\$table->longText('$key')->nullable();
      } ''';
      } else {
        query += '''
	\$table->longText('$key')->nullable();
      } ''';
      }
    });
    query += '''
});
 \$id = DB::connection('$dName')->table('$tablename')->''';
    if (ke != '') {
      query += '''where('$ke', '$valu')->update''';
    } else {
      query += '''insertGetId''';
    }
    query += '''([''';

    data.forEach((key, value) {
      printer(value);
      // printer(value.runtimeType);
      // var decodeSucceeded = false;
      // try {
      //   var decodedJSON = json.decode(json.encode(value));
      //   printer(decodedJSON);
      //   decodeSucceeded = true;
      // } on FormatException catch (e) {
      //   printer('The provided string is not valid JSON');
      //   decodeSucceeded = false;
      // }
      // printer('Decoding succeeded: $decodeSucceeded');

      if (key == 'uid') {
        if (ke == '') {
          query += '''
        '$key' => uniqid(),
        ''';
        }
      } else if (key == 'created_at') {
        if (ke == '') {
          query += '''
        '$key' => \$dat,
        ''';
        }
      } else if (key == 'updated_at') {
        // if (ke == '') {
        query += '''
        '$key' => \$dat,
        ''';
        // }
      } else if (value != null) {
        if (value is List<dynamic>) {
          query += '''
        '$key' => '${json.encode(value)}',
        ''';
        } else {
          query += '''
        '$key' => '$value',
        ''';
        }

        //     } else {
        //     query += '''
        // '$key' => '$value',
        // ''';
      }
    }
        //   if (value != null) {
        //     if (value is List<dynamic>) {
        //       query += '''
        //     '$key' => '${json.encode(value)}',
        //     ''';
        //     } else {
        //       query += '''
        //     '$key' => '$value',
        //     ''';
        //     }

        //     //     } else {
        //     //     query += '''
        //     // '$key' => '$value',
        //     // ''';
        //   }
        // }
        // }
        // }
        );
    ;
    query += '''
       ]);

       return \$id;

''';
    return query;
    // await postquery(query);
  }

  static String delttable(String dName, String tablename, Map data) {
    String query = '''


          // \$rr =   DB::connection('schoolurl')->table('schools')->get();
          // return \$rr;
  if (!Schema::connection('$dName')->hasTable('$tablename')) {

         return 'f';

  }else{''';
    data.forEach((key, value) {
      query += '''
     if (!Schema::connection('$dName')->hasColumn('$tablename', '$key')) {
	      return 'f';
      } ''';
    });
    query += '''
    if(!DB::connection('$dName')->table('$tablename')->where(function(\$query) {\$query''';
    data.forEach((key, value) {
      query += '''->where('$key', '$value')''';
    });
    query += ''';})->exists()){
      return 'f';
    }else{

      \$rr = DB::connection('$dName')->table('$tablename')->where(function(\$query) {\$query''';
    data.forEach((key, value) {
      query += '''->where('$key', '$value')''';
    });
    query += ''';})->delete();
      return json_encode(\$rr);
      
    }
  }



''';
    return query;
    // await postquery(query);
  }
}

bool isJSON(str) {
  try {
    json.decode(str);
  } catch (e) {
    return false;
  }
  return true;
}

class ActionColumn {
  static String setcolumn(
      String dName, String tablename, String columnname, Object data) {
    printer(dName);
    printer(tablename);
    printer(columnname);
    String query = '''

    Schema::connection('$dName')->table('$tablename', function (\$table) {
      if (!Schema::connection('$dName')->hasColumn('$tablename', '$columnname')) {
	 \$table->longText('$columnname')->nullable();
      } 
    });


''';
    return query;
    // await postquery(query);
  }

  static String checkcolumn(String dName, String tablename, String columnname) {
    printer(dName);
    printer(tablename);
    printer(columnname);
    String query = '''

    Schema::connection('$dName')->table('$tablename', function (\$table) {
      if (!Schema::connection('$dName')->hasColumn('$tablename', '$columnname')) {
	 \$table->longText('$columnname')->nullable();
      } 
    });


''';
    return query;
    // await postquery(query);
  }

  static String getcolumnall(
      String dName, String tablename, String columnname) {
    printer(dName);
    printer(tablename);
    printer(columnname);
    String query = '''

      if (!Schema::connection('$dName')->hasColumn('$tablename', '$columnname')) {
      	return 'f';
      } else{
        
       \$names = DB::connection('$dName')->table('$tablename')
            //  ->select('$columnname')
                ->pluck('$columnname');
                \$dt = [];
                foreach (\$names as \$name) {
                  if (is_object(json_decode(\$name))) 
{ 
array_push(\$dt, json_decode(\$name, true));
}else{
array_push(\$dt, \$name);
}
            }
            //  \$r = [];
            //  for(\$dt in \$d){
            //    array_push(\$r, json_decode(\$d['form'],true));
            //    }
       return json_encode(\$dt);
      //  return json_encode(\$names);
      }


''';
    return query;
    // await postquery(query);
  }

  static String getall(String dName, String tablename, String columnname) {
    printer(dName);
    printer(tablename);
    printer(columnname);
    String query = '''
   

date_default_timezone_set('Asia/Kolkata');
  if (!Schema::connection('$dName')->hasTable('$tablename')) {

         return 'f';

  }else{
    return Schema::connection('$dName')->table('$tablename')->pluck('$columnname');
  }

''';
    return query;
    // await postquery(query);
  }
}

class ActionRow {
  static String checkrow(
    String dName,
    String tablename,
    String columnname,
    Object rowdata,
    String key,
    String name,
  ) {
    var data = json.encode(rowdata);
    var rKey = 'id';
    String query = '';
    if (key != '') {
      printer('ind');
      printer(key);
      rKey = key;
      query = '''
   \$dat = date('Y-m-d H:i:s');
   if (DB::connection('$dName')->table('$tablename')->where('$key', '$name')->exists()) {
    DB::connection('$dName')->table('$tablename')->where('$key', '$name')->update([
    '$columnname' => '$data',
    'updated_at' => \$dat,
        ]);
   }else{
     
   }


''';
    } else {
      printer('illa');
      query = '''

  \$id =   DB::connection('$dName')->table('$tablename')->insertGetId(
    ['$columnname' => '$data'],
        );

       return \$id;
       
''';
    }

    return query;
  }

  static String checkrowstring(
    String dName,
    String tablename,
    String columnname,
    Object rowdata,
    String key,
    String name,
  ) {
    var data = json.encode(rowdata);
    var rKey = 'id';
    String query = '';
    if (key != '') {
      printer('ind');
      printer(key);
      rKey = key;
      query = '''
   \$dat = date('Y-m-d H:i:s');
   if (DB::connection('$dName')->table('$tablename')->where('$key', '$name')->exists()) {
    DB::connection('$dName')->table('$tablename')->where('$key', '$name')->update([
    '$columnname' => $data,
    'updated_at' => \$dat,
        ]);
   }else{
     
   }


''';
    } else {
      printer('illa');
      query = '''

  \$id =   DB::connection('$dName')->table('$tablename')->insertGetId(
    ['$columnname' => $data],
        );

       return \$id;
       
''';
    }

    return query;
  }
}

class ActionChild {
  static String getAllchild(
    String dName,
    String tablename,
    String columnname,
    String key,
    String name,
    // Object childname,
  ) {
    var rKey = 'id';
    String query = '';
    if (key != '') {
      // var ch = jsonEncode({
      //   'query': child,
      // });
      rKey = key;
      query = '''


   if (DB::connection('$dName')->table('$tablename')->where('$key', '$name')->exists()) {

       \$sitem = DB::connection('$dName')->table('$tablename')
             ->select('id', '$columnname')
             ->where('$key', '$name')
             ->first();

    }else{
      return 'f';
    }

//     \$id = \$sitem->id;

    \$item = \$sitem->$columnname;
    // \$ite = \$sitem->$columnname;

//     \$names = array_values(\$item);
//      \$dt = [];
//                 foreach (\$names as \$name) {
//                   if (is_object(json_decode(\$name))) 
// { 
// array_push(\$dt, json_decode(\$name, true));
// }else{
// array_push(\$dt, \$name);
// }
// }
       return strval(\$item);

    // \$item['\$childname']

''';
    } else {
      query = '''


  \$id =   DB::connection('$dName')->table('$tablename')->insertGetId(
    ['$columnname' => '[]'],
        );


       \$sitem = DB::connection('$dName')->table('$tablename')
             ->select('$columnname')
             ->where('id', \$id)
             ->first();

    \$item = \$sitem->$columnname;
     
//     \$names = array_values(\$item);
// \$dt = [];
//                 foreach (\$names as \$name) {
//                   if (is_object(json_decode(\$name))) 
// { 
// array_push(\$dt, json_decode(\$name, true));
// }else{
// array_push(\$dt, \$name);
// }
// }
   
       return strval(\$item);

    // \$item['\$childname']

''';
    }

    return query;
  }

  static String firstchild(String dName, String tablename, String columnname,
      String key, String name) {
    var rKey = 'id';
    String query = '';
//     if (isget) {
//       query = '''

//    if (DB::connection('$dName')->table('$tablename')->where('$key', '$name')->exists()) {

//        \$sitem = DB::connection('$dName')->table('$tablename')
//              ->select('id', '$columnname')
//              ->where('$key', '$name')
//              ->first();

//     }else{
//       return 'f';
//     }

//     \$id = \$sitem->id;

//     \$item = json_decode(\$sitem->$columnname, true);

//      \$IsD = \$item['$childname']

// ''';
//     } else {
    if (key != '') {
      // var ch = jsonEncode({
      //   'query': child,
      // });
      rKey = key;
      query = '''


   if (DB::connection('$dName')->table('$tablename')->where('$key', '$name')->exists()) {

       \$sitem = DB::connection('$dName')->table('$tablename')
             ->select('id', '$columnname')
             ->where('$key', '$name')
             ->first();

    }else{
      return 'f';
    }

    \$id = \$sitem->id;

    \$item = json_decode(\$sitem->$columnname, true);


''';
    } else {
      query = '''


  \$id =   DB::connection('$dName')->table('$tablename')->insertGetId(
    ['$columnname' => '[]'],
        );


       \$sitem = DB::connection('$dName')->table('$tablename')
             ->select('$columnname')
             ->where('id', \$id)
             ->first();

    \$item = json_decode(\$sitem->$columnname, true);
     

  

''';
    }
    // }

    return query;
  }

  static String secondchil(
    String key,
    String name,
    String childname,
  ) {
    var rKey = 'id';
    printer('vellye');
    String query = '';
    if (key != '') {
      // var ch = jsonEncode({
      //   'query': child,
      // });
      rKey = key;
      query = '''

 
    ['$childname']

''';
    }

    return query;
  }

  static String thirdchild(String dName, String tablename, String columnname,
      String key, String name, Object childata, String last) {
    var data = json.encode(childata);
    // data = data.replaceAll(''', '\'');
    printer(data);
    var rKey = 'id';
    String query = '';

    if (key != '') {
      // var ch = jsonEncode({
      //   'query': child,
      // });
      rKey = key;
      printer(" \$item$last = json_decode('$data',true);");
      query = '''
 \$item$last = json_decode('$data',true);
 \$mydata = json_encode(\$item);
 \$dat = date('Y-m-d H:i:s');
   if (DB::connection('$dName')->table('$tablename')->where('id', \$id)->exists()) {
  DB::connection('$dName')->table('$tablename')->where('id', \$id)->update([
    '$columnname' => \$mydata,
    'updated_at' => \$dat,
        ]);
    }
   return \$id;
''';
    } else {
      printer(" \$item$last = json_decode('$data',true);");
      query = '''
 \$item$last = json_decode('$data',true);
 \$mydata = json_encode(\$item);
 \$dat = date('Y-m-d H:i:s');
 if (DB::connection('$dName')->table('$tablename')->where('id', \$id)->exists()) {
  DB::connection('$dName')->table('$tablename')->where('id', \$id)->update([
    '$columnname' => \$mydata,
    'updated_at' => \$dat,
        ]);
    }
  return \$id;
''';
    }

    return query;
  }

  static String thirdchildADd(String dName, String tablename, String columnname,
      String key, String name, Object childata, String last) {
    var data = json.encode(childata);
    // data = data.replaceAll(''', '\'');
    printer(data);
    var rKey = 'id';
    String query = '';

    if (key != '') {
      // var ch = jsonEncode({
      //   'query': child,
      // });
      rKey = key;
      printer(" \$itev = json_decode('$data',true);");
      query = '''
array_push(\$item$last , json_decode('$data',true));
 \$mydata = json_encode(\$item);
 \$dat = date('Y-m-d H:i:s');
   if (DB::connection('$dName')->table('$tablename')->where('id', \$id)->exists()) {
  DB::connection('$dName')->table('$tablename')->where('id', \$id)->update([
    '$columnname' => \$mydata,
    'updated_at' => \$dat,
        ]);
    }
return \$id;
''';
    } else {
      printer(" \$item$last = json_decode('$data',true);");
      query = '''
 \$item$last = json_decode('$data',true);
 \$mydata = json_encode(\$item);
 \$dat = date('Y-m-d H:i:s');
 if (DB::connection('$dName')->table('$tablename')->where('id', \$id)->exists()) {
  DB::connection('$dName')->table('$tablename')->where('id', \$id)->update([
    '$columnname' => \$mydata,
    'updated_at' => \$dat,
        ]);
    }
return \$id;
''';
    }

    return query;
  }

  static String thirdchildGet(String dName, String tablename, String columnname,
      String key, String name, String last) {
    // data = data.replaceAll(''', '\'');
    var rKey = 'id';
    String query = '';

    if (key != '') {
      // var ch = jsonEncode({
      //   'query': child,
      // });
      rKey = key;
      query = '''
\$sID = \$item$last;
return json_encode(\$sID);
''';
    } else {
      query = '''
\$sID = \$item$last;
return json_encode(\$sID);
''';
    }

    return query;
  }
}
