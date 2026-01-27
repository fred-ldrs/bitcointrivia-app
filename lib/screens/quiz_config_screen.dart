import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../models/quiz_config.dart';
import '../services/database_service.dart';
import 'quiz_screen.dart';

class QuizConfigScreen extends StatefulWidget {
  const QuizConfigScreen({super.key});

  @override
  State<QuizConfigScreen> createState() => _QuizConfigScreenState();
}

class _QuizConfigScreenState extends State<QuizConfigScreen> {
  final DatabaseService _dbService = DatabaseService();
  
  String _difficulty = 'easy';
  final Set<String> _selectedCategories = {
    'General Knowledge',
    'History',
    'Tech',
    'Culture'
  };
  int _numberOfQuestions = 10;
  bool _customQuestionCount = false;
  final TextEditingController _customCountController = TextEditingController();
  
  // Mapping von Kategorienamen zu Übersetzungsschlüsseln
  String _getCategoryDisplayName(String category) {
    final l10n = AppLocalizations.of(context)!;
    switch (category) {
      case 'History':
        return l10n.categoryHistory;
      case 'Tech':
        return l10n.categoryTech;
      case 'Culture':
        return l10n.categoryCulture;
      case 'General Knowledge':
        return l10n.categoryGeneralKnowledge;
      default:
        return category;
    }
  }
  
  int _availableQuestions = 0;
  bool _isLoading = true;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      _isInitialized = true;
      _loadAvailableQuestions();
    }
  }

  @override
  void dispose() {
    _customCountController.dispose();
    super.dispose();
  }

  Future<void> _loadAvailableQuestions() async {
    if (!mounted) return;
    
    setState(() => _isLoading = true);
    
    try {
      final locale = Localizations.localeOf(context).languageCode;
      final config = QuizConfig(
        difficulty: _difficulty,
        categories: _selectedCategories.toList(),
        numberOfQuestions: _numberOfQuestions,
        language: locale,
      );
      
      final count = await _dbService.getAvailableQuestionCount(config);
      
      if (!mounted) return;
      
      setState(() {
        _availableQuestions = count;
        // Passe Fragenanzahl an, wenn mehr ausgewählt sind als verfügbar
        if (_numberOfQuestions > count && count > 0) {
          _numberOfQuestions = count;
        }
        // Falls benutzerdefinierte Anzahl größer als verfügbar
        if (_customQuestionCount) {
          final customCount = int.tryParse(_customCountController.text) ?? 10;
          if (customCount > count && count > 0) {
            _customCountController.text = count.toString();
          }
        }
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      
      setState(() {
        _isLoading = false;
      });
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Fehler beim Laden der Datenbank: $e'),
          duration: const Duration(seconds: 5),
        ),
      );
    }
  }

  void _startQuiz() async {
    final locale = Localizations.localeOf(context).languageCode;
    
    if (_selectedCategories.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.selectAtLeastOneCategory),
        ),
      );
      return;
    }

    int questionCount = _numberOfQuestions;
    if (_customQuestionCount) {
      questionCount = int.tryParse(_customCountController.text) ?? 10;
      if (questionCount < 1) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.invalidQuestionCount),
          ),
        );
        return;
      }
    }

    if (questionCount > _availableQuestions) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            AppLocalizations.of(context)!
                .notEnoughQuestions(_availableQuestions),
          ),
        ),
      );
      return;
    }

    final config = QuizConfig(
      difficulty: _difficulty,
      categories: _selectedCategories.toList(),
      numberOfQuestions: questionCount,
      language: locale,
    );

    if (!mounted) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuizScreen(config: config),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.quizConfiguration),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Schwierigkeit
                  Text(
                    l10n.difficulty,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  SegmentedButton<String>(
                    segments: [
                      ButtonSegment(
                        value: 'easy',
                        label: Text(l10n.difficultyEasy),
                      ),
                      ButtonSegment(
                        value: 'normal',
                        label: Text(l10n.difficultyNormal),
                      ),
                      ButtonSegment(
                        value: 'difficult',
                        label: Text(l10n.difficultyDifficult),
                      ),
                    ],
                    selected: {_difficulty},
                    onSelectionChanged: (Set<String> selected) {
                      setState(() {
                        _difficulty = selected.first;
                      });
                      _loadAvailableQuestions();
                    },
                  ),

                  const SizedBox(height: 24),

                  // Kategorien
                  Text(
                    l10n.categories,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  CheckboxListTile(
                    title: Text(_getCategoryDisplayName('History')),
                    value: _selectedCategories.contains('History'),
                    onChanged: (bool? value) {
                      setState(() {
                        if (value == true) {
                          _selectedCategories.add('History');
                        } else {
                          _selectedCategories.remove('History');
                        }
                      });
                      _loadAvailableQuestions();
                    },
                  ),
                  CheckboxListTile(
                    title: Text(_getCategoryDisplayName('Tech')),
                    value: _selectedCategories.contains('Tech'),
                    onChanged: (bool? value) {
                      setState(() {
                        if (value == true) {
                          _selectedCategories.add('Tech');
                        } else {
                          _selectedCategories.remove('Tech');
                        }
                      });
                      _loadAvailableQuestions();
                    },
                  ),
                  CheckboxListTile(
                    title: Text(_getCategoryDisplayName('Culture')),
                    value: _selectedCategories.contains('Culture'),
                    onChanged: (bool? value) {
                      setState(() {
                        if (value == true) {
                          _selectedCategories.add('Culture');
                        } else {
                          _selectedCategories.remove('Culture');
                        }
                      });
                      _loadAvailableQuestions();
                    },
                  ),
                  CheckboxListTile(
                    title: Text(_getCategoryDisplayName('General Knowledge')),
                    value: _selectedCategories.contains('General Knowledge'),
                    onChanged: (bool? value) {
                      setState(() {
                        if (value == true) {
                          _selectedCategories.add('General Knowledge');
                        } else {
                          _selectedCategories.remove('General Knowledge');
                        }
                      });
                      _loadAvailableQuestions();
                    },
                  ),

                  const SizedBox(height: 24),

                  // Fragenanzahl
                  Text(
                    l10n.numberOfQuestions,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  
                  if (!_customQuestionCount) ...[
                    SegmentedButton<int>(
                      segments: [
                        ButtonSegment(
                          value: 5,
                          label: const Text('5'),
                          enabled: _availableQuestions >= 5,
                        ),
                        ButtonSegment(
                          value: 10,
                          label: const Text('10'),
                          enabled: _availableQuestions >= 10,
                        ),
                        ButtonSegment(
                          value: 15,
                          label: const Text('15'),
                          enabled: _availableQuestions >= 15,
                        ),
                      ],
                      selected: {_numberOfQuestions},
                      onSelectionChanged: (Set<int> selected) {
                        setState(() {
                          _numberOfQuestions = selected.first;
                        });
                      },
                    ),
                    const SizedBox(height: 8),
                    TextButton.icon(
                      onPressed: () {
                        setState(() {
                          _customQuestionCount = true;
                          _customCountController.text = _numberOfQuestions.toString();
                        });
                      },
                      icon: const Icon(Icons.edit),
                      label: Text(l10n.customAmount),
                    ),
                  ] else ...[
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _customCountController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: l10n.numberOfQuestions,
                              border: const OutlineInputBorder(),
                              helperText: 'Max: $_availableQuestions',
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _customQuestionCount = false;
                              int parsedCount = int.tryParse(
                                      _customCountController.text) ??
                                  10;
                              // Begrenze auf verfügbare Fragen
                              if (parsedCount > _availableQuestions) {
                                parsedCount = _availableQuestions;
                              }
                              _numberOfQuestions = parsedCount > 0 ? parsedCount : 1;
                            });
                          },
                          icon: const Icon(Icons.check),
                        ),
                      ],
                    ),
                  ],

                  const SizedBox(height: 16),

                  // Verfügbare Fragen
                  Card(
                    color: _availableQuestions < 5 
                        ? Colors.orange.withOpacity(0.2) 
                        : null,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Icon(
                            _availableQuestions < 5 
                                ? Icons.warning_amber 
                                : Icons.info_outline,
                            color: _availableQuestions < 5 
                                ? Colors.orange 
                                : null,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              l10n.availableQuestions(_availableQuestions),
                              style: TextStyle(
                                fontWeight: _availableQuestions < 5 
                                    ? FontWeight.bold 
                                    : null,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Start Button
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: _availableQuestions > 0 ? _startQuiz : null,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          l10n.startQuiz,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
