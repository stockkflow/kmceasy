import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';
import '../widgets/primary_button.dart';
import '../widgets/custom_text_field.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  String _selectedType = 'Gider'; // Expense

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: kTextColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'İşlem Ekle',
          style: GoogleFonts.inter(
            color: kTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Type Selector
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: kInputBackgroundColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _selectedType = 'Gider'),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: _selectedType == 'Gider'
                                ? kRedColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'Gider',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              color: kTextColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _selectedType = 'Gelir'),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: _selectedType == 'Gelir'
                                ? kGreenColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'Gelir',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              color: kTextColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Amount Input
              Text(
                'Tutar',
                style: GoogleFonts.inter(color: kHintColor, fontSize: 14),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                style: GoogleFonts.inter(
                  color: kTextColor,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  prefixText: '₺',
                  prefixStyle: GoogleFonts.inter(
                    color: kTextColor,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                  border: InputBorder.none,
                  hintText: '0.00',
                  hintStyle: GoogleFonts.inter(
                    color: Colors.white24,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Category Selector (Placeholder)
              Text(
                'Kategori',
                style: GoogleFonts.inter(color: kHintColor, fontSize: 14),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: kInputBackgroundColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.category, color: kTextColor),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      'Kategori Seç',
                      style: GoogleFonts.inter(color: kTextColor, fontSize: 16),
                    ),
                    const Spacer(),
                    const Icon(Icons.chevron_right, color: kHintColor),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Note Input
              CustomTextField(
                label: 'Not',
                controller: _noteController,
                hintText: 'İşlem notu ekle...',
                icon: Icons.note,
              ),
              const SizedBox(height: 48),

              // Save Button
              PrimaryButton(
                text: 'Kaydet',
                onPressed: () {
                  // TODO: Implement save functionality
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
