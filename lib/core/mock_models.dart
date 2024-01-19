//
class MockUserPlan {
  int id;
  String title;
  String date;
  bool isDone;
  List<MockUserPlanDetails> details;
  MockUserPlan({
    required this.id,
    required this.title,
    required this.date,
    required this.isDone,
    required this.details,
  });

  static List<MockUserPlan> list = [
    MockUserPlan(
      id: 1,
      title: 'شنبه',
      date: '1402/01/01',
      isDone: true,
      details: [
        MockUserPlanDetails(
          title: 'تمرین پا',
          description: "تمرین تقویت عضلات پا",
          durationInMinutes: 15,
          specialInstructions: "بدون فشار به زانو",
          issueReported: false,
          mockPlanList: [
            MockPlan(
              title: 'تمرین تقویت عضلات ساق پا',
              description: 'این تمرین برای تقویت عضلات ساق پا مفید است.',
              planMedia:
                  'https://mir-s3-cdn-cf.behance.net/project_modules/hd/6e20ba80486129.5ce2e67ba3555.gif',
              durationInSecond: 120,
            ),
            MockPlan(
              title: 'حرکات کششی پا',
              description: 'حرکات کششی برای افزایش انعطاف پذیری پا.',
              planMedia:
                  'https://mir-s3-cdn-cf.behance.net/project_modules/hd/6e20ba80486129.5ce2e67ba3555.gif',
              durationInSecond: 180,
            ),
            MockPlan(
              title: 'پرش بلند',
              description: 'تمرین برای تقویت عضلات پا و بهبود تعادل.',
              planMedia:
                  'https://mir-s3-cdn-cf.behance.net/project_modules/hd/6e20ba80486129.5ce2e67ba3555.gif',
              durationInSecond: 150,
            ),
            MockPlan(
              title: 'اسکات',
              description: 'تمرین اسکات برای تقویت کلیه عضلات پایین تنه.',
              planMedia:
                  'https://mir-s3-cdn-cf.behance.net/project_modules/hd/6e20ba80486129.5ce2e67ba3555.gif',
              durationInSecond: 200,
            ),
            MockPlan(
              title: 'دویدن درجا',
              description: 'تمرین هوازی برای بهبود گردش خون در پاها.',
              planMedia:
                  'https://mir-s3-cdn-cf.behance.net/project_modules/hd/6e20ba80486129.5ce2e67ba3555.gif',
              durationInSecond: 300,
            ),
          ],
        ),
        MockUserPlanDetails(
          title: 'تمرین کمر',
          description: "تمرین کششی برای کمر",
          durationInMinutes: 10,
          specialInstructions: "اجتناب از خم شدن ناگهانی",
          issueReported: true,
          issueDetails: "کمی درد در ناحیه کمر",
          mockPlanList: [
            MockPlan(
              title: 'کشش پشت کمر',
              description: 'تمرین کششی برای کاهش تنش و درد در پشت کمر.',
              planMedia:
                  'https://mir-s3-cdn-cf.behance.net/project_modules/hd/6e20ba80486129.5ce2e67ba3555.gif',
              durationInSecond: 180,
            ),
            MockPlan(
              title: 'بریج',
              description: 'تمرین بریج برای تقویت عضلات کمر و شکم.',
              planMedia:
                  'https://mir-s3-cdn-cf.behance.net/project_modules/hd/6e20ba80486129.5ce2e67ba3555.gif',
              durationInSecond: 150,
            ),
            MockPlan(
              title: 'تمرین پلانک',
              description: 'پلانک برای تقویت مرکز بدن و کمر.',
              planMedia:
                  'https://mir-s3-cdn-cf.behance.net/project_modules/hd/6e20ba80486129.5ce2e67ba3555.gif',
              durationInSecond: 120,
            ),
            MockPlan(
              title: 'چرخش تنه',
              description: 'تمرین چرخش تنه برای افزایش انعطاف پذیری کمر.',
              planMedia:
                  'https://mir-s3-cdn-cf.behance.net/project_modules/hd/6e20ba80486129.5ce2e67ba3555.gif',
              durationInSecond: 200,
            ),
            MockPlan(
              title: 'حرکت کششی سوپرمن',
              description: 'تمرین سوپرمن برای تقویت عضلات کمر و شکم.',
              planMedia:
                  'https://mir-s3-cdn-cf.behance.net/project_modules/hd/6e20ba80486129.5ce2e67ba3555.gif',
              durationInSecond: 180,
            ),
          ],
        ),
        MockUserPlanDetails(
          title: 'تمرین تعادل',
          description: "تمرینات تعادلی",
          durationInMinutes: 20,
          specialInstructions: "انجام در کنار دیوار برای حفظ تعادل",
          issueReported: false,
          mockPlanList: [
            MockPlan(
              title: 'تمرین تعادل پای یکی',
              description: 'ایستادن بر روی یک پا برای بهبود تعادل و هماهنگی.',
              planMedia:
                  'https://mir-s3-cdn-cf.behance.net/project_modules/hd/6e20ba80486129.5ce2e67ba3555.gif',
              durationInSecond: 120,
            ),
            MockPlan(
              title: 'توپ تعادل',
              description:
                  'استفاده از توپ تعادل برای تقویت عضلات مرکزی و تعادل.',
              planMedia:
                  'https://mir-s3-cdn-cf.behance.net/project_modules/hd/6e20ba80486129.5ce2e67ba3555.gif',
              durationInSecond: 180,
            ),
            MockPlan(
              title: 'تعادل بر روی تخته',
              description: 'تمرین با تخته تعادل برای تقویت عضلات پا و هماهنگی.',
              planMedia:
                  'https://mir-s3-cdn-cf.behance.net/project_modules/hd/6e20ba80486129.5ce2e67ba3555.gif',
              durationInSecond: 150,
            ),
            MockPlan(
              title: 'یوگا تعادل',
              description: 'پوزیشن‌های یوگا برای تقویت تعادل و انعطاف پذیری.',
              planMedia:
                  'https://mir-s3-cdn-cf.behance.net/project_modules/hd/6e20ba80486129.5ce2e67ba3555.gif',
              durationInSecond: 200,
            ),
            MockPlan(
              title: 'تمرین تعادل و پرش',
              description: 'پرش‌های کوچک با حفظ تعادل برای تقویت هماهنگی بدن.',
              planMedia:
                  'https://mir-s3-cdn-cf.behance.net/project_modules/hd/6e20ba80486129.5ce2e67ba3555.gif',
              durationInSecond: 180,
            ),
          ],
        ),
      ],
    ),
    MockUserPlan(
      id: 2,
      title: 'یک شنبه',
      date: '1402/02/07',
      isDone: true,
      details: [
        MockUserPlanDetails(
          title: 'تمرین پا',
          description: "تمرین تقویت عضلات پا",
          durationInMinutes: 15,
          specialInstructions: "بدون فشار به زانو",
          issueReported: false,
          mockPlanList: [
            MockPlan(
              title: 'تمرین تقویت عضلات ساق پا',
              description: 'این تمرین برای تقویت عضلات ساق پا مفید است.',
              planMedia: 'sagh_pa.mp4',
              durationInSecond: 120,
            ),
            MockPlan(
              title: 'حرکات کششی پا',
              description: 'حرکات کششی برای افزایش انعطاف پذیری پا.',
              planMedia: 'kesheshi_pa.mp4',
              durationInSecond: 180,
            ),
            MockPlan(
              title: 'پرش بلند',
              description: 'تمرین برای تقویت عضلات پا و بهبود تعادل.',
              planMedia: 'parsh_boland.mp4',
              durationInSecond: 150,
            ),
            MockPlan(
              title: 'اسکات',
              description: 'تمرین اسکات برای تقویت کلیه عضلات پایین تنه.',
              planMedia: 'squat.mp4',
              durationInSecond: 200,
            ),
            MockPlan(
              title: 'دویدن درجا',
              description: 'تمرین هوازی برای بهبود گردش خون در پاها.',
              planMedia: 'davidan_darja.mp4',
              durationInSecond: 300,
            ),
          ],
        ),
        MockUserPlanDetails(
          title: 'تمرین کمر',
          description: "تمرین کششی برای کمر",
          durationInMinutes: 10,
          specialInstructions: "اجتناب از خم شدن ناگهانی",
          issueReported: true,
          issueDetails: "کمی درد در ناحیه کمر",
          mockPlanList: [
            MockPlan(
              title: 'تمرین تقویت عضلات ساق پا',
              description: 'این تمرین برای تقویت عضلات ساق پا مفید است.',
              planMedia:
                  'https://mir-s3-cdn-cf.behance.net/project_modules/hd/6e20ba80486129.5ce2e67ba3555.gif',
              durationInSecond: 120,
            ),
            MockPlan(
              title: 'حرکات کششی پا',
              description: 'حرکات کششی برای افزایش انعطاف پذیری پا.',
              planMedia:
                  'https://mir-s3-cdn-cf.behance.net/project_modules/hd/6e20ba80486129.5ce2e67ba3555.gif',
              durationInSecond: 180,
            ),
            MockPlan(
              title: 'پرش بلند',
              description: 'تمرین برای تقویت عضلات پا و بهبود تعادل.',
              planMedia:
                  'https://mir-s3-cdn-cf.behance.net/project_modules/hd/6e20ba80486129.5ce2e67ba3555.gif',
              durationInSecond: 150,
            ),
            MockPlan(
              title: 'اسکات',
              description: 'تمرین اسکات برای تقویت کلیه عضلات پایین تنه.',
              planMedia:
                  'https://mir-s3-cdn-cf.behance.net/project_modules/hd/6e20ba80486129.5ce2e67ba3555.gif',
              durationInSecond: 200,
            ),
            MockPlan(
              title: 'دویدن درجا',
              description: 'تمرین هوازی برای بهبود گردش خون در پاها.',
              planMedia:
                  'https://mir-s3-cdn-cf.behance.net/project_modules/hd/6e20ba80486129.5ce2e67ba3555.gif',
              durationInSecond: 300,
            ),
          ],
        ),
        MockUserPlanDetails(
          title: 'تمرین تعادل',
          description: "تمرینات تعادلی",
          durationInMinutes: 20,
          specialInstructions: "انجام در کنار دیوار برای حفظ تعادل",
          issueReported: false,
          mockPlanList: [
            MockPlan(
              title: 'تمرین تعادل پای یکی',
              description: 'ایستادن بر روی یک پا برای بهبود تعادل و هماهنگی.',
              planMedia:
                  'https://mir-s3-cdn-cf.behance.net/project_modules/hd/6e20ba80486129.5ce2e67ba3555.gif',
              durationInSecond: 120,
            ),
            MockPlan(
              title: 'توپ تعادل',
              description:
                  'استفاده از توپ تعادل برای تقویت عضلات مرکزی و تعادل.',
              planMedia:
                  'https://mir-s3-cdn-cf.behance.net/project_modules/hd/6e20ba80486129.5ce2e67ba3555.gif',
              durationInSecond: 180,
            ),
            MockPlan(
              title: 'تعادل بر روی تخته',
              description: 'تمرین با تخته تعادل برای تقویت عضلات پا و هماهنگی.',
              planMedia:
                  'https://mir-s3-cdn-cf.behance.net/project_modules/hd/6e20ba80486129.5ce2e67ba3555.gif',
              durationInSecond: 150,
            ),
            MockPlan(
              title: 'یوگا تعادل',
              description: 'پوزیشن‌های یوگا برای تقویت تعادل و انعطاف پذیری.',
              planMedia:
                  'https://mir-s3-cdn-cf.behance.net/project_modules/hd/6e20ba80486129.5ce2e67ba3555.gif',
              durationInSecond: 200,
            ),
            MockPlan(
              title: 'تمرین تعادل و پرش',
              description: 'پرش‌های کوچک با حفظ تعادل برای تقویت هماهنگی بدن.',
              planMedia:
                  'https://mir-s3-cdn-cf.behance.net/project_modules/hd/6e20ba80486129.5ce2e67ba3555.gif',
              durationInSecond: 180,
            ),
          ],
        ),
      ],
    ),
    MockUserPlan(
      id: 3,
      title: 'دو شنبه',
      date: '1402/03/09',
      isDone: false,
      details: [
        MockUserPlanDetails(
          title: 'تمرین پا',
          description: "تمرین تقویت عضلات پا",
          durationInMinutes: 15,
          specialInstructions: "بدون فشار به زانو",
          issueReported: false,
          mockPlanList: [
            MockPlan(
              title: 'تمرین تقویت عضلات ساق پا',
              description: 'این تمرین برای تقویت عضلات ساق پا مفید است.',
              planMedia: 'sagh_pa.mp4',
              durationInSecond: 120,
            ),
            MockPlan(
              title: 'حرکات کششی پا',
              description: 'حرکات کششی برای افزایش انعطاف پذیری پا.',
              planMedia: 'kesheshi_pa.mp4',
              durationInSecond: 180,
            ),
            MockPlan(
              title: 'پرش بلند',
              description: 'تمرین برای تقویت عضلات پا و بهبود تعادل.',
              planMedia: 'parsh_boland.mp4',
              durationInSecond: 150,
            ),
            MockPlan(
              title: 'اسکات',
              description: 'تمرین اسکات برای تقویت کلیه عضلات پایین تنه.',
              planMedia: 'squat.mp4',
              durationInSecond: 200,
            ),
            MockPlan(
              title: 'دویدن درجا',
              description: 'تمرین هوازی برای بهبود گردش خون در پاها.',
              planMedia: 'davidan_darja.mp4',
              durationInSecond: 300,
            ),
          ],
        ),
        MockUserPlanDetails(
          title: 'تمرین کمر',
          description: "تمرین کششی برای کمر",
          durationInMinutes: 10,
          specialInstructions: "اجتناب از خم شدن ناگهانی",
          issueReported: true,
          issueDetails: "کمی درد در ناحیه کمر",
          mockPlanList: [
            MockPlan(
              title: 'کشش پشت کمر',
              description: 'تمرین کششی برای کاهش تنش و درد در پشت کمر.',
              planMedia: 'keshesh_poshte_kamar.mp4',
              durationInSecond: 180,
            ),
            MockPlan(
              title: 'بریج',
              description: 'تمرین بریج برای تقویت عضلات کمر و شکم.',
              planMedia: 'bridge.mp4',
              durationInSecond: 150,
            ),
            MockPlan(
              title: 'تمرین پلانک',
              description: 'پلانک برای تقویت مرکز بدن و کمر.',
              planMedia: 'plank.mp4',
              durationInSecond: 120,
            ),
            MockPlan(
              title: 'چرخش تنه',
              description: 'تمرین چرخش تنه برای افزایش انعطاف پذیری کمر.',
              planMedia: 'cherkhesh_taneh.mp4',
              durationInSecond: 200,
            ),
            MockPlan(
              title: 'حرکت کششی سوپرمن',
              description: 'تمرین سوپرمن برای تقویت عضلات کمر و شکم.',
              planMedia: 'superman.mp4',
              durationInSecond: 180,
            ),
          ],
        ),
      ],
    ),
    MockUserPlan(
      id: 4,
      title: 'سه شنبه',
      date: '1402/02/02',
      isDone: false,
      details: [
        MockUserPlanDetails(
          title: 'تمرین تعادل',
          description: "تمرینات تعادلی",
          durationInMinutes: 20,
          specialInstructions: "انجام در کنار دیوار برای حفظ تعادل",
          issueReported: false,
          mockPlanList: [
            MockPlan(
              title: 'تمرین تعادل پای یکی',
              description: 'ایستادن بر روی یک پا برای بهبود تعادل و هماهنگی.',
              planMedia: 'balance_one_leg.mp4',
              durationInSecond: 120,
            ),
            MockPlan(
              title: 'توپ تعادل',
              description:
                  'استفاده از توپ تعادل برای تقویت عضلات مرکزی و تعادل.',
              planMedia: 'balance_ball.mp4',
              durationInSecond: 180,
            ),
            MockPlan(
              title: 'تعادل بر روی تخته',
              description: 'تمرین با تخته تعادل برای تقویت عضلات پا و هماهنگی.',
              planMedia: 'balance_board.mp4',
              durationInSecond: 150,
            ),
            MockPlan(
              title: 'یوگا تعادل',
              description: 'پوزیشن‌های یوگا برای تقویت تعادل و انعطاف پذیری.',
              planMedia: 'yoga_balance.mp4',
              durationInSecond: 200,
            ),
            MockPlan(
              title: 'تمرین تعادل و پرش',
              description: 'پرش‌های کوچک با حفظ تعادل برای تقویت هماهنگی بدن.',
              planMedia:
                  'https://mir-s3-cdn-cf.behance.net/project_modules/hd/6e20ba80486129.5ce2e67ba3555.gif',
              durationInSecond: 180,
            ),
          ],
        ),
      ],
    ),
    MockUserPlan(
      id: 5,
      title: 'چهار شنبه',
      date: '1402/02/02',
      isDone: false,
      details: [
        MockUserPlanDetails(
          title: 'تمرین پا',
          description: "تمرین تقویت عضلات پا",
          durationInMinutes: 15,
          specialInstructions: "بدون فشار به زانو",
          issueReported: false,
          mockPlanList: [
            MockPlan(
              title: 'تمرین تقویت عضلات ساق پا',
              description: 'این تمرین برای تقویت عضلات ساق پا مفید است.',
              planMedia: 'sagh_pa.mp4',
              durationInSecond: 120,
            ),
            MockPlan(
              title: 'حرکات کششی پا',
              description: 'حرکات کششی برای افزایش انعطاف پذیری پا.',
              planMedia: 'kesheshi_pa.mp4',
              durationInSecond: 180,
            ),
            MockPlan(
              title: 'پرش بلند',
              description: 'تمرین برای تقویت عضلات پا و بهبود تعادل.',
              planMedia: 'parsh_boland.mp4',
              durationInSecond: 150,
            ),
            MockPlan(
              title: 'اسکات',
              description: 'تمرین اسکات برای تقویت کلیه عضلات پایین تنه.',
              planMedia: 'squat.mp4',
              durationInSecond: 200,
            ),
            MockPlan(
              title: 'دویدن درجا',
              description: 'تمرین هوازی برای بهبود گردش خون در پاها.',
              planMedia: 'davidan_darja.mp4',
              durationInSecond: 300,
            ),
          ],
        ),
      ],
    ),
    MockUserPlan(
      id: 6,
      title: 'پنج شنبه',
      date: '1402/02/02',
      isDone: false,
      details: [],
    ),
  ];
}

//
class MockUserPlanDetails {
  String title;
  String description;
  int durationInMinutes;
  String specialInstructions;
  bool issueReported;
  String issueDetails;
  List<MockPlan> mockPlanList;

  MockUserPlanDetails({
    required this.title,
    required this.description,
    required this.durationInMinutes,
    required this.specialInstructions,
    required this.mockPlanList,
    this.issueReported = false,
    this.issueDetails = '',
  });
}

//

class MockPlan {
  String title;
  String description;
  String planMedia;
  int durationInSecond;

  MockPlan({
    required this.title,
    required this.description,
    required this.planMedia,
    required this.durationInSecond,
  });
}
