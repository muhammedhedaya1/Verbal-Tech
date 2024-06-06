import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddChildScreen extends StatefulWidget {
  @override
  _AddChildScreenState createState() => _AddChildScreenState();
}

class _AddChildScreenState extends State<AddChildScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  int _age = 0;
  String _address = '';
  String _problem = '';

  void _submitData() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      FirebaseFirestore.instance.collection('children').add({
        'name': _name,
        'age': _age,
        'address': _address,
        'problem': _problem,
        'timestamp': Timestamp.now(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('تم ارسال البيانات بنجاح')),
      );

      _formKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(375, 812), minTextAdapt: true, splitScreenMode: true);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'يرجي ادخال البيانات الخاصه بطفلك',
            textAlign: TextAlign.right,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'الاسم',
                    alignLabelWithHint: true,
                    labelStyle: TextStyle(
                      fontSize: 16.sp,
                    ),
                  ),
                  textDirection: TextDirection.rtl,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'من فضلك ادخل الاسم';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _name = value!;
                  },
                ),
                SizedBox(height: 10.h),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'العمر',
                    alignLabelWithHint: true,
                    labelStyle: TextStyle(
                      fontSize: 16.sp,
                    ),
                  ),
                  textDirection: TextDirection.rtl,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty || int.tryParse(value) == null) {
                      return 'من فضلك ادخل العمر';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _age = int.parse(value!);
                  },
                ),
                SizedBox(height: 10.h),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'العنوان',
                    alignLabelWithHint: true,
                    labelStyle: TextStyle(
                      fontSize: 16.sp,
                    ),
                  ),
                  textDirection: TextDirection.rtl,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'من فضلك ادخل العنوان';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _address = value!;
                  },
                ),
                SizedBox(height: 10.h),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'ما المشكله التي يعاني منها الطفل تحديدا',
                    alignLabelWithHint: true,
                    labelStyle: TextStyle(
                      fontSize: 16.sp,
                    ),
                  ),
                  textDirection: TextDirection.rtl,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'من فضلك ادخل مشكله طفلك';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _problem = value!;
                  },
                ),
                SizedBox(height: 20.h),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink, // background
                    foregroundColor: Colors.white, // foreground
                    fixedSize: Size(MediaQuery.of(context).size.width,
                        50), // حدد الارتفاع حسب رغبتك
                  ),
                  onPressed: _submitData,
                  child: Text('ارسال'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
