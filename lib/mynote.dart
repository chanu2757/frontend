import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(AccordionApp());
}

class AccordionApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AccordionPage(),
    );
  }
}

class AccordionPage extends StatelessWidget //__
    {
  final _headerStyle = TextStyle(
      color: Color(0xffffffff), fontSize: 15, fontWeight: FontWeight.bold);
  final _headerStyleSmall = TextStyle(
      color: Color(0xffffffff), fontSize: 12, fontWeight: FontWeight.bold);
  final _contentStyleHeader = TextStyle(
      color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.w700);
  final _contentStyle = TextStyle(
      color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.normal);
  final _loremIpsum =
  '''In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available. It is also used to temporarily replace text in a process called greeking, which allows designers to consider the form of a webpage or publication, without the meaning of the text influencing the design.''';
  final _loremIpsum2 =
  '''Lorem ipsum is typically a corrupted version of 'De finibus bonorum et malorum', a 1st century BC text by the Roman statesman and philosopher Cicero, with words altered, added, and removed to make it nonsensical and improper Latin.''';

  build(context) => Scaffold(
    backgroundColor: Colors.blueGrey[100],
    appBar: AppBar(
      title: Text('Accordion'),
    ),
    body: Accordion(
      maxOpenSections: 4,
      contentBorderColor: Color(0xfffffffff),
      headerBackgroundColor: Color(0x111111111),
      headerPadding: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
      children: [
        AccordionSection(
          isOpen: true,
          leftIcon: Icon(Icons.insights_rounded, color: Colors.white),
          header: Text('Introduction', style: _headerStyle),
          content: Text(_loremIpsum2, style: _contentStyle),
          contentHorizontalPadding: 20,
        ),
        AccordionSection(
          isOpen: false,
          leftIcon: Icon(Icons.compare_rounded, color: Colors.white),
          header: Text('About Us', style: _headerStyle),
          content: Row(
            children: [
              Icon(Icons.compare_rounded,
                  size: 120, color: Colors.orangeAccent),
              Flexible(
                  flex: 1, child: Text(_loremIpsum2, style: _contentStyle)),
            ],
          ),
        ),
        AccordionSection(
          isOpen: false,
          leftIcon: Icon(Icons.food_bank, color: Colors.white),
          header: Text('Company Info', style: _headerStyle),
          content: DataTable(
            sortAscending: true,
            sortColumnIndex: 1,
            dataRowHeight: 40,
            showBottomBorder: false,
            columns: [
              DataColumn(
                  label: Text('ID', style: _contentStyleHeader),
                  numeric: true),
              DataColumn(
                  label: Text('Description', style: _contentStyleHeader)),
              DataColumn(
                  label: Text('Price', style: _contentStyleHeader),
                  numeric: true),
            ],
            rows: [
              DataRow(
                cells: [
                  DataCell(Text('1',
                      style: _contentStyle, textAlign: TextAlign.right)),
                  DataCell(Text('Fancy Product', style: _contentStyle)),
                  DataCell(Text(r'$ 199.99',
                      style: _contentStyle, textAlign: TextAlign.right))
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('2',
                      style: _contentStyle, textAlign: TextAlign.right)),
                  DataCell(Text('Another Product', style: _contentStyle)),
                  DataCell(Text(r'$ 79.00',
                      style: _contentStyle, textAlign: TextAlign.right))
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('3',
                      style: _contentStyle, textAlign: TextAlign.right)),
                  DataCell(Text('Really Cool Stuff', style: _contentStyle)),
                  DataCell(Text(r'$ 9.99',
                      style: _contentStyle, textAlign: TextAlign.right))
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('4',
                      style: _contentStyle, textAlign: TextAlign.right)),
                  DataCell(
                      Text('Last Product goes here', style: _contentStyle)),
                  DataCell(Text(r'$ 19.99',
                      style: _contentStyle, textAlign: TextAlign.right))
                ],
              ),
            ],
          ),
        ),
        AccordionSection(
          isOpen: false,
          leftIcon: Icon(Icons.contact_page, color: Colors.white),
          header: Text('Contact', style: _headerStyle),
          content: Wrap(
            children: List.generate(
                30,
                    (index) => Icon(Icons.contact_page,
                    size: 30, color: Color(0xff999999))),
          ),
        ),
        AccordionSection(
          isOpen: false,
          leftIcon: Icon(Icons.computer, color: Colors.white),
          header: Text('Jobs', style: _headerStyle),
          content:
          Icon(Icons.computer, size: 200, color: Color(0xff999999)),
        ),
        AccordionSection(
          isOpen: false,
          leftIcon: Icon(Icons.map, color: Colors.white),
          header: Text('Map', style: _headerStyle),
          content: Icon(Icons.map, size: 200, color: Color(0xff999999)),
        ),
      ],
    ),
  );
} //__