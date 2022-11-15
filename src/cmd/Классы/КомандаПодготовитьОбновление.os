// MIT License
// Copyright (c) 2020 Silverbulleters LLC
// All rights reserved.

#Использовать fs
#Использовать gitrunner
#Использовать v8runner
#Использовать v8storage
#Использовать asserts
#Использовать logos

Перем Лог;
Перем ПараметрыОбновления;
Перем МенеджерСинхронизации;

Процедура ОписаниеКоманды(КомандаПриложения) Экспорт
	
	КомандаПриложения.Опция("e projectPath", "", "Путь к репозитарию подготовки обновления")
		.ТСтрока()
		.Обязательный(Ложь)
		.ВОкружении("RECTOR_PROJECT_PATH");

	КомандаПриложения.Опция("b src-base", "", "Путь к исходникам базовой конфигурации")
		.ТСтрока()
		.Обязательный(Ложь)
		.ВОкружении("RECTOR_SRC_BASE");

	КомандаПриложения.Опция("bu src-base-user", "", "Пользователь хранилища базовой конфигурации")
		.ТСтрока()
		.Обязательный(Ложь)
		.ВОкружении("RECTOR_SRC_BASE_USER");

	КомандаПриложения.Опция("bp src-base-pwd", "", "Пароль пользователя хранилища базовой конфигурации")
		.ТСтрока()
		.Обязательный(Ложь)
		.ВОкружении("RECTOR_SRC_BASE_PWD");

	КомандаПриложения.Опция("bv src-base-version", "", "Версия в хранилище базовой конфигурации")
		.ТЧисло()
		.Обязательный(Ложь)
		.ПоУмолчанию(0)
		.ВОкружении("RECTOR_SRC_BASE_VERSION");

	КомандаПриложения.Опция("bb src-base-branch", "", "Имя ветки в git-репозитарии базовой конфигурации")
		.ТСтрока()
		.Обязательный(Ложь)
		.ВОкружении("RECTOR_SRC_BASE_BRANCH");

	КомандаПриложения.Опция("bc src-base-commit", "", "Хэш коммита в git-репозитарии базовой конфигурации")
		.ТСтрока()
		.Обязательный(Ложь)
		.ВОкружении("RECTOR_SRC_BASE_COMMIT");

	КомандаПриложения.Опция("c src-current", "", "Путь к исходникам текущей конфигурации")
		.ТСтрока()
		.Обязательный(Истина)
		.ВОкружении("RECTOR_SRC_CURRENT");

	КомандаПриложения.Опция("cu src-current-user", "", "Пользователь хранилища текущей конфигурации")
		.ТСтрока()
		.Обязательный(Ложь)
		.ВОкружении("RECTOR_SRC_CURRENT_USER");

	КомандаПриложения.Опция("cp src-current-pwd", "", "Пароль пользователя хранилища текущей конфигурации")
		.ТСтрока()
		.Обязательный(Ложь)
		.ВОкружении("RECTOR_SRC_CURRENT_PWD");

	КомандаПриложения.Опция("cv src-current-version", "", "Версия в хранилище текущей конфигурации")
		.ТЧисло()
		.Обязательный(Ложь)
		.ПоУмолчанию(0)
		.ВОкружении("RECTOR_SRC_CURRENT_VERSION");

	КомандаПриложения.Опция("cb src-current-branch", "", "Имя ветки в git-репозитарии текущей конфигурации")
		.ТСтрока()
		.Обязательный(Ложь)
		.ВОкружении("RECTOR_SRC_CURRENT_BRANCH");

	КомандаПриложения.Опция("cc src-current-commit", "", "Хэш коммита в git-репозитарии текущей конфигурации")
		.ТСтрока()
		.Обязательный(Ложь)
		.ВОкружении("RECTOR_SRC_CURRENT_COMMIT");

	КомандаПриложения.Опция("n src-new", "", "Путь к исходникам новой конфигурации")
		.ТСтрока()
		.Обязательный(Истина)
		.ВОкружении("RECTOR_SRC_NEW");

	КомандаПриложения.Опция("nu src-new-user", "", "Пользователь хранилища новой конфигурации")
		.ТСтрока()
		.Обязательный(Ложь)
		.ВОкружении("RECTOR_SRC_NEW_USER");

	КомандаПриложения.Опция("np src-new-pwd", "", "Пароль пользователя хранилища новой конфигурации")
		.ТСтрока()
		.Обязательный(Ложь)
		.ВОкружении("RECTOR_SRC_NEW_PWD");

	КомандаПриложения.Опция("nv src-new-version", "", "Версия в хранилище новой конфигурации")
		.ТЧисло()
		.Обязательный(Ложь)
		.ПоУмолчанию(0)
		.ВОкружении("RECTOR_SRC_NEW_VERSION");

	КомандаПриложения.Опция("nb src-new-branch", "", "Имя ветки в git-репозитарии новой конфигурации")
		.ТСтрока()
		.Обязательный(Ложь)
		.ВОкружении("RECTOR_SRC_NEW_BRANCH");

	КомандаПриложения.Опция("nc src-new-commit", "", "Хэш коммита в git-репозитарии новой конфигурации")
		.ТСтрока()
		.Обязательный(Ложь)
		.ВОкружении("RECTOR_SRC_NEW_COMMIT");

	КомандаПриложения.Опция("t temp-dir", "", "Каталог с временными файлами")
		.ТСтрока()
		.Обязательный(Ложь)
		.ВОкружении("RECTOR_TEMP_DIR");

	КомандаПриложения.Опция("i ib-connection ibconnection", "", "путь подключения к информационной базе")
		.ТСтрока()
		.Обязательный(Ложь)
		.ВОкружении("RECTOR_IB_CONNECTION");

	КомандаПриложения.Аргумент("CONFIG", "", "путь к файлу настройки подготовки обновления")
		.ТСтрока()
		.ВОкружении("RECTOR_CONFIG")
		.Обязательный(Ложь)
		.ПоУмолчанию(ОбъединитьПути(ТекущийКаталог(), ПараметрыПриложения.ИмяФайлаНастройкиПакетнойСинхронизации()));
	
КонецПроцедуры

Процедура ВыполнитьКоманду(Знач КомандаПриложения) Экспорт

	ИнициализацияПроекта(КомандаПриложения);
	
	ГитРепозитарий = Новый ГитРепозиторий();
	ГитРепозитарий.УстановитьРабочийКаталог(ПараметрыОбновления.Путь);
	Если НЕ ГитРепозитарий.ЭтоРепозиторий() Тогда
		МенеджерСинхронизации.ИнициализироватьGITРепозитарий();
	КонецЕсли;

	ОсновнойПутьВыгрузки = ОбъединитьПути(ПараметрыОбновления.Путь, ПутьИсходныФайлов());

	// Выгрузка базовой конфигурации поставщика
	Если НЕ ПараметрыОбновления.Базовая.Путь = Неопределено Тогда
		ВыгрузитьКонфигурацию(ОсновнойПутьВыгрузки, ПараметрыОбновления.Базовая);
		Комментарий = "Загружена базовая конфигурация";
		ИмяКоммитера = "1c";
		ПочтаКоммитера = "1c@1c.ru";
		ДатаКоммита = '20150102';
		МенеджерСинхронизации.СохранитьИзмененияGit(Комментарий, ИмяКоммитера, ПочтаКоммитера, ДатаКоммита);
		Гит_ПерейтиВВетку(ГитРепозитарий, "base1c", Истина);
	КонецЕсли;

	// Выгрузка текущей конфигурации
	Если ПараметрыОбновления.Базовая.Путь = Неопределено Тогда
		ВременныйПутьВыгрузки = ОбъединитьПути(ПараметрыОбновления.КаталогВременныхФайлов, "current", ПутьИсходныФайлов());
	Иначе
		Лог.Информация("Удаление исходников в каталоге ""%1""", ОсновнойПутьВыгрузки);
		УдалитьФайлы(ОсновнойПутьВыгрузки, "*.*");

		ВременныйПутьВыгрузки = ОсновнойПутьВыгрузки;
		Гит_ПерейтиВВетку(ГитРепозитарий, "master", , Истина);
	КонецЕсли;
	ВыгрузитьКонфигурацию(ВременныйПутьВыгрузки, ПараметрыОбновления.Текущая);


	// Выгрузка базовой конфигурации поставщика
	Если ПараметрыОбновления.Базовая.Путь = Неопределено Тогда
		КаталогКонфигурацииПоставщика = ОбъединитьПути(ВременныйПутьВыгрузки,
		                                               ПутьКонфигурацииПоставщика());
		
		НайденныеФайлы = НайтиФайлы(КаталогКонфигурацииПоставщика, "*.cf");
		Ожидаем.Что(НайденныеФайлы.Количество()).Равно(1);
		ИмяКонфигурацииПоставщика = НайденныеФайлы[0].Имя;
		Лог.Информация("Найдена конфигурация поставщика: " + ИмяКонфигурацииПоставщика);

		ПараметрыОбновления.Базовая.Путь = НайденныеФайлы[0].ПолноеИмя;

		ВыгрузитьКонфигурацию(ОсновнойПутьВыгрузки, ПараметрыОбновления.Базовая);
		Комментарий = "Загружена базовая конфигурация";
		ИмяКоммитера = "1c";
		ПочтаКоммитера = "1c@1c.ru";
		ДатаКоммита = '20150102';
		МенеджерСинхронизации.СохранитьИзмененияGit(Комментарий, ИмяКоммитера, ПочтаКоммитера, ДатаКоммита);

		Гит_ПерейтиВВетку(ГитРепозитарий, "base1c", Истина);
		Гит_ПерейтиВВетку(ГитРепозитарий, "master", , Истина);

		Лог.Информация("Удаление исходников в каталоге ""%1""", ОсновнойПутьВыгрузки);
		УдалитьФайлы(ОсновнойПутьВыгрузки, "*.*");

		Лог.Информация("Копирование файлов конфигурации ""%1"" -> ""%2""",
		               ВременныйПутьВыгрузки,
		               ОсновнойПутьВыгрузки);
		ФС.КопироватьСодержимоеКаталога(ВременныйПутьВыгрузки, ОсновнойПутьВыгрузки);
		
		Лог.Информация("Удаление исходников в каталоге ""%1""", ВременныйПутьВыгрузки);
		УдалитьФайлы(ВременныйПутьВыгрузки, "*.*");
		
		Комментарий = "Выгружена измененная конфигурация";
		ИмяКоммитера = "bit";
		ПочтаКоммитера = "oskk@1cbit.ru";
		ДатаКоммита = '20150103';
		МенеджерСинхронизации.СохранитьИзмененияGit(Комментарий, ИмяКоммитера, ПочтаКоммитера, ДатаКоммита);
		УдалитьФайлы(ОсновнойПутьВыгрузки);

	КонецЕсли;

	Гит_ПерейтиВВетку(ГитРепозитарий, "base1c", , Истина);

	Лог.Информация("Удаление исходников в каталоге ""%1""", ОсновнойПутьВыгрузки);
	УдалитьФайлы(ОсновнойПутьВыгрузки, "*.*");

	// Выгрузка новой конфигурации поставщика
	ВыгрузитьКонфигурацию(ОсновнойПутьВыгрузки, ПараметрыОбновления.Обновление);
	Комментарий = "Загружена новая конфигурация поставщика";
	ИмяКоммитера = "1c";
	ПочтаКоммитера = "1c@1c.ru";
	ДатаКоммита = '20150104';
	МенеджерСинхронизации.СохранитьИзмененияGit(Комментарий, ИмяКоммитера, ПочтаКоммитера, ДатаКоммита);

	Гит_ПерейтиВВетку(ГитРепозитарий, "master", , Истина);

	ПараметрыКоманды = Новый Массив();
	ПараметрыКоманды.Добавить("merge");
	ПараметрыКоманды.Добавить("base1c");
	Лог.Информация("Мержим изменения из base1C");
	ГитРепозитарий.ВыполнитьКоманду(ПараметрыКоманды);

	Лог.Информация("Очистка каталога временных файлов ""%1""", ПараметрыОбновления.КаталогВременныхФайлов);
	УдалитьФайлы(ПараметрыОбновления.КаталогВременныхФайлов, "*.*");

	Лог.Информация("Репозитарий ""%1"" подготовлен для продолжения обновления!", ПараметрыОбновления.Путь);

КонецПроцедуры // ВыполнитьКоманду()

Процедура ВыгрузитьКонфигурацию(Знач Путь, Знач ПараметрыКонфигурации)

	Если ПараметрыКонфигурации.ТипИсходников = ТипыИсходников().Выгрузка Тогда

		Если ПараметрыКонфигурации.ЭтоРепозитарий Тогда
			ГитРепозитарий = Новый ГитРепозиторий();
			ГитРепозитарий.УстановитьРабочийКаталог(Путь);
			Если ЗначениеЗаполнено(ПараметрыКонфигурации.Ветка) Тогда
				Гит_ПерейтиВВетку(ГитРепозитарий, ПараметрыКонфигурации.Ветка);
			КонецЕсли;
			Если ЗначениеЗаполнено(ПараметрыКонфигурации.Коммит) Тогда
				Гит_ПереключитьсяНаКоммит(Путь, ПараметрыКонфигурации.Коммит);
			КонецЕсли;
		КонецЕсли;

		Лог.Информация("Копирование файлов конфигурации ""%1"" -> ""%2""",
		               ПараметрыКонфигурации.Путь,
		               Путь);
		ФС.КопироватьСодержимоеКаталога(ПараметрыКонфигурации.Путь, Путь);

	ИначеЕсли ПараметрыКонфигурации.ТипИсходников = ТипыИсходников().Хранилище Тогда
		
		ИмяФайлаКонфигурации =  ОбъединитьПути(ПараметрыОбновления.КаталогВременныхФайлов, "export.cf");

		КонфигураторВременнойБазы = Новый УправлениеКонфигуратором();
		КонфигураторВременнойБазы.ИспользоватьВерсиюПлатформы(ПараметрыОбновления.ВерсияПлатформы);
		КонфигураторВременнойБазы.УстановитьКонтекст(ПараметрыОбновления.ВременнаяБаза, "", "");
		КонфигураторВременнойБазы.УстановитьКодЯзыка("RU");

		ХранилищеКонфигурации = Новый МенеджерХранилищаКонфигурации(ПараметрыКонфигурации.Путь, КонфигураторВременнойБазы);
		ХранилищеКонфигурации.УстановитьПараметрыАвторизации(ПараметрыКонфигурации.Пользователь, ПараметрыКонфигурации.Пароль);

		Лог.Информация("Сохранение конфигурации хранилища ""%1"" (%2) в файл ""%3""",
		               ПараметрыКонфигурации.Путь,
		               ?(ПараметрыКонфигурации.Версия <= 0, "последняя версия", ПараметрыКонфигурации.Версия),
		               ИмяФайлаКонфигурации);
		ХранилищеКонфигурации.СохранитьВерсиюКонфигурацииВФайл(?(ПараметрыКонфигурации.Версия <= 0,
		                                                       -1,
		                                                       ПараметрыКонфигурации.Версия),
		                                                       ИмяФайлаКонфигурации);

		Лог.Информация("Загрузка конфигурации ""%1"" во временную ИБ ""%2""",
		               ИмяФайлаКонфигурации,
		               ПараметрыОбновления.ВременнаяБаза);
		КонфигураторВременнойБазы.ЗагрузитьКонфигурациюИзФайла(ИмяФайлаКонфигурации);
		
		УдалитьФайлы(ИмяФайлаКонфигурации);

		Лог.Информация("Выгрузка исходников конфигурации в каталог ""%1""", Путь);
		КонфигураторВременнойБазы.ВыгрузитьКонфигурациюВФайлы(Путь);
	
	ИначеЕсли ПараметрыКонфигурации.ТипИсходников = ТипыИсходников().Конфигурация Тогда

		КонфигураторВременнойБазы = Новый УправлениеКонфигуратором();
		КонфигураторВременнойБазы.ИспользоватьВерсиюПлатформы(ПараметрыОбновления.ВерсияПлатформы);
		КонфигураторВременнойБазы.УстановитьКонтекст(ПараметрыОбновления.ВременнаяБаза, "", "");
		
		Лог.Информация("Загрузка конфигурации ""%1"" во временную ИБ ""%2""",
		               ПараметрыКонфигурации.Путь,
		               ПараметрыОбновления.ВременнаяБаза);
		КонфигураторВременнойБазы.ЗагрузитьКонфигурациюИзФайла(ПараметрыКонфигурации.Путь);
		
		Лог.Информация("Выгрузка исходников конфигурации ""%1"" в каталог ""%2""", ПараметрыКонфигурации.Путь, Путь);
		КонфигураторВременнойБазы.ВыгрузитьКонфигурациюВФайлы(Путь);

	Иначе
		ВызватьИсключение СтрШаблон("Неизвестный тип исходников ""%1""", ПараметрыКонфигурации.ТипИсходников);
	КонецЕсли;

КонецПроцедуры // ВыгрузитьКонфигурацию()

Процедура ИнициализацияПроекта(КомандаПриложения)

	ПараметрыОбновления = СтруктураПараметровОбновления();
	ПараметрыОбновления.Путь = КомандаПриложения.ЗначениеОпции("projectPath");
	ПараметрыОбновления.ВерсияПлатформы = КомандаПриложения.ЗначениеОпции("v8version");

	Если ПараметрыОбновления.Путь = "" Тогда
		ПараметрыОбновления.Путь = ПараметрыПриложения.КаталогЭкспорта();
		Лог.Информация("Каталог подготовки обновления по умолчанию: ""%1""", ПараметрыОбновления.Путь);
	КонецЕсли;

	ФС.ОбеспечитьПустойКаталог(ПараметрыОбновления.Путь);

	ПараметрыЭкспорта = Новый Структура();
	ПараметрыЭкспорта.Вставить("КаталогЭкспорта", ПараметрыОбновления.Путь);
	МенеджерСинхронизации = Новый МенеджерСинхронизации(ПараметрыЭкспорта);

	ПараметрыОбновления.ВременнаяБаза = КомандаПриложения.ЗначениеОпции("ib-connection");
	Если НЕ ПараметрыОбновления.ВременнаяБаза = "" Тогда
		Лог.Информация("Используем существующую ИБ для подключения к хранилищу: ""%1""", ПараметрыОбновления.ВременнаяБаза);
	КонецЕсли;

	ПараметрыОбновления.КаталогВременныхФайлов = КомандаПриложения.ЗначениеОпции("temp-dir");
	Если ПараметрыОбновления.КаталогВременныхФайлов = "" Тогда
		ПараметрыОбновления.КаталогВременныхФайлов = ПараметрыПриложения.КаталогВременныхФайлов();
		Лог.Информация("Каталог временных файлов: ""%1""", ПараметрыОбновления.КаталогВременныхФайлов);
	КонецЕсли;

	ФС.ОбеспечитьПустойКаталог(ПараметрыОбновления.КаталогВременныхФайлов);

	ПараметрыИсходников = СтруктураПараметровИсходников(КомандаПриложения.ЗначениеОпции("src-current"));
	Если ПараметрыИсходников.ТипИсходников = ТипыИсходников().Хранилище Тогда
		ПараметрыИсходников.Вставить("Пользователь", КомандаПриложения.ЗначениеОпции("src-current-user"));
		ПараметрыИсходников.Вставить("Пароль"      , КомандаПриложения.ЗначениеОпции("src-current-pwd"));
		ПараметрыИсходников.Вставить("Версия"      , КомандаПриложения.ЗначениеОпции("src-current-version"));
	ИначеЕсли ПараметрыИсходников.ЭтоРепозитарий Тогда
		ПараметрыИсходников.Вставить("Ветка" , КомандаПриложения.ЗначениеОпции("src-current-branch"));
		ПараметрыИсходников.Вставить("Коммит", КомандаПриложения.ЗначениеОпции("src-current-commit"));
	КонецЕсли;
	ПараметрыОбновления.Текущая = ПараметрыИсходников;

	ПараметрыИсходников = СтруктураПараметровИсходников(КомандаПриложения.ЗначениеОпции("src-new"));
	Если ПараметрыИсходников.ТипИсходников = ТипыИсходников().Хранилище Тогда
		ПараметрыИсходников.Вставить("Пользователь", КомандаПриложения.ЗначениеОпции("src-new-user"));
		ПараметрыИсходников.Вставить("Пароль"      , КомандаПриложения.ЗначениеОпции("src-new-pwd"));
		ПараметрыИсходников.Вставить("Версия"      , КомандаПриложения.ЗначениеОпции("src-new-version"));
	ИначеЕсли ПараметрыИсходников.ЭтоРепозитарий Тогда
		ПараметрыИсходников.Вставить("Ветка" , КомандаПриложения.ЗначениеОпции("src-new-branch"));
		ПараметрыИсходников.Вставить("Коммит", КомандаПриложения.ЗначениеОпции("src-new-commit"));
	КонецЕсли;
	ПараметрыОбновления.Обновление = ПараметрыИсходников;

	Базовая_Исходники = КомандаПриложения.ЗначениеОпции("src-base");

	Если ЗначениеЗаполнено(Базовая_Исходники) Тогда
		ПараметрыИсходников = СтруктураПараметровИсходников(Базовая_Исходники);
		Если ПараметрыИсходников.ТипИсходников = ТипыИсходников().Хранилище Тогда
			ПараметрыИсходников.Вставить("Пользователь", КомандаПриложения.ЗначениеОпции("src-base-user"));
			ПараметрыИсходников.Вставить("Пароль"      , КомандаПриложения.ЗначениеОпции("src-base-pwd"));
			ПараметрыИсходников.Вставить("Версия"      , КомандаПриложения.ЗначениеОпции("src-base-version"));
		ИначеЕсли ПараметрыИсходников.ЭтоРепозитарий Тогда
			ПараметрыИсходников.Вставить("Ветка" , КомандаПриложения.ЗначениеОпции("src-base-branch"));
			ПараметрыИсходников.Вставить("Коммит", КомандаПриложения.ЗначениеОпции("src-base-commit"));
		КонецЕсли;
		ПараметрыОбновления.Базовая = ПараметрыИсходников;
	Иначе
		ПараметрыОбновления.Базовая = Новый Структура("Путь, ТипИсходников");
		ПараметрыОбновления.Базовая.Вставить("Путь"         , Неопределено);
		ПараметрыОбновления.Базовая.Вставить("ТипИсходников", ТипыИсходников().Конфигурация);
	КонецЕсли;

КонецПроцедуры // ИнициализацияПроекта()

Функция СтруктураПараметровОбновления()

	СтруктураПараметров = Новый Структура();
	СтруктураПараметров.Вставить("Путь"                  , "");
	СтруктураПараметров.Вставить("ВерсияПлатформы"       , "8.3");
	СтруктураПараметров.Вставить("Базовая"               , Новый Структура("Путь"));
	СтруктураПараметров.Вставить("Текущая"               , Новый Структура("Путь"));
	СтруктураПараметров.Вставить("Обновление"            , Новый Структура("Путь"));
	СтруктураПараметров.Вставить("КаталогВременныхФайлов", "");
	СтруктураПараметров.Вставить("ВременнаяБаза"         , "");

	Возврат СтруктураПараметров;

КонецФункции // СтруктураПараметровОбновления()

Функция СтруктураПараметровИсходников(Знач Путь)

	ТипИсходников = ТипИсходников(Путь);
	
	ЭтоРепозитарий = Ложь;
	Если НЕ (ТипИсходников = ТипыИсходников().Хранилище ИЛИ ТипИсходников = ТипыИсходников().Конфигурация) Тогда
		ГитРепозитарий = Новый ГитРепозиторий();
		ГитРепозитарий.УстановитьРабочийКаталог(Путь);
		ЭтоРепозитарий = ГитРепозитарий.ЭтоРепозиторий();
	КонецЕсли;

	СтруктураПараметров = Новый Структура();
	СтруктураПараметров.Вставить("Путь"          , Путь);
	СтруктураПараметров.Вставить("ТипИсходников" , ТипИсходников);
	СтруктураПараметров.Вставить("ЭтоРепозитарий", ЭтоРепозитарий);

	Возврат СтруктураПараметров;

КонецФункции // СтруктураПараметровИсходников()

Функция ТипИсходников(Знач Путь) Экспорт

	Если ЭтоПутьКХранилищу(Путь) Тогда
		Возврат ТипыИсходников().Хранилище;
	КонецЕсли;

	Если ЭтоФайлКонфигурации(Путь) Тогда
		Возврат ТипыИсходников().Конфигурация;
	КонецЕсли;

	Если ЭтоКаталогВыгрузкиКонфигурации(Путь) Тогда
		Возврат ТипыИсходников().Выгрузка;
	КонецЕсли;
	
	Если ЭтоКаталогВыгрузкиEDT(Путь) Тогда
		Возврат ТипыИсходников().ВыгрузкаEDT;
	КонецЕсли;
	
	Возврат Неопределено;

КонецФункции // ТипИсходников()

Функция ЭтоПутьКХранилищу(Знач Путь)

	Если Лев(ВРег(Путь), 4) = ВРег("tcp:")
	 ИЛИ Лев(ВРег(Путь), 5) = ВРег("http:")
	 ИЛИ Лев(ВРег(Путь), 6) = ВРег("https:") Тогда
		Возврат Истина;
	КонецЕсли;

	ВремФайл = Новый Файл(Путь);

	Если НЕ (ВремФайл.ЭтоКаталог() И ВремФайл.Существует()) Тогда
		Возврат Ложь;
	КонецЕсли;

	ВремФайл = Новый Файл(ОбъединитьПути(Путь, "1cv8ddb.1CD"));
	Если ВремФайл.ЭтоФайл() И ВремФайл.Существует() Тогда
		Возврат Истина;
	КонецЕсли;

	Возврат Ложь;

КонецФункции // ЭтоПутьКХранилищу()

Функция ЭтоФайлКонфигурации(Знач Путь)

	ВремФайл = Новый Файл(Путь);

	Если ВремФайл.ЭтоФайл()
	   И ВремФайл.Существует()
	   И ВРег(ВремФайл.Расширение) = ВРег(".cf") Тогда
		Возврат Истина;
	КонецЕсли;
 
	Возврат Ложь;

КонецФункции // ЭтоФайлКонфигурации()

Функция ЭтоКаталогВыгрузкиКонфигурации(Знач Путь)

	ВремФайл = Новый Файл(Путь);

	Если НЕ (ВремФайл.ЭтоКаталог() И ВремФайл.Существует()) Тогда
		Возврат Ложь;
	КонецЕсли;

	ВремФайл = Новый Файл(ОбъединитьПути(Путь, "Configuration.xml"));
	Если ВремФайл.ЭтоФайл() И ВремФайл.Существует() Тогда
		Возврат Истина;
	КонецЕсли;

	Возврат Ложь;

КонецФункции // ЭтоКаталогВыгрузкиКонфигурации()

Функция ЭтоКаталогВыгрузкиEDT(Знач Путь)

	ВремФайл = Новый Файл(Путь);

	Если НЕ (ВремФайл.ЭтоКаталог() И ВремФайл.Существует()) Тогда
		Возврат Ложь;
	КонецЕсли;

	ВремФайл = Новый Файл(ОбъединитьПути(Путь, "Configuration", "Configuration.mdo"));
	Если ВремФайл.ЭтоФайл() И ВремФайл.Существует() Тогда
		Возврат Истина;
	КонецЕсли;

	Возврат Ложь;

КонецФункции // ЭтоКаталогВыгрузкиEDT()

Функция ТипыИсходников() Экспорт

	ТипыИсходников = Новый Структура();
	ТипыИсходников.Вставить("Конфигурация", "Конфигурация");
	ТипыИсходников.Вставить("Хранилище"   , "Хранилище");
	ТипыИсходников.Вставить("Выгрузка"    , "Выгрузка");
	ТипыИсходников.Вставить("ВыгрузкаEDT" , "Выгрузка EDT");

	Возврат Новый ФиксированнаяСтруктура(ТипыИсходников);
	
КонецФункции // ТипыИсходников()

Процедура Гит_ПереключитьсяНаКоммит(КаталогРепозитория, Коммит)

	КомандаЧекаут = Новый Команда();
	КомандаЧекаут.УстановитьКоманду("git");
	КомандаЧекаут.ПоказыватьВыводНемедленно(Ложь);
	КомандаЧекаут.ДобавитьПараметр("checkout");
	КомандаЧекаут.ДобавитьПараметр(Коммит);
	КомандаЧекаут.УстановитьРабочийКаталог(КаталогРепозитория);
	КомандаЧекаут.Исполнить();

КонецПроцедуры // Гит_ПереключитьсяНаКоммит()

Функция Гит_ВеткаСуществует(ГитРепозитарий, Ветка)

	ТаблицаВеток = ГитРепозитарий.ПолучитьСписокВеток();
	Возврат ТаблицаВеток.НайтиСтроки(Новый Структура("Имя", Ветка)).Количество() > 0;

КонецФункции // Гит_ВеткаСуществует()

Процедура Гит_ПерейтиВВетку(ГитРепозитарий, Знач Ветка, Знач СоздатьНовую = Ложь, Знач Принудительно = Ложь)

	ВеткаСуществует = Гит_ВеткаСуществует(ГитРепозитарий, Ветка);

	Если СоздатьНовую Тогда
		СоздатьНовую = НЕ ВеткаСуществует;
	КонецЕсли;

	Лог.Информация("%1 ветку ""%2"" в репозитарии ""%3""",
	               ?(ВеткаСуществует, "Переходим на", "Создаем новую"),
	               Ветка,
	               ГитРепозитарий.ПолучитьРабочийКаталог());
	ГитРепозитарий.ПерейтиВВетку(Ветка, СоздатьНовую, Принудительно);

КонецПроцедуры // Гит_ПерейтиНаВетку()

Функция ПутьИсходныФайлов() Экспорт
	Возврат ОбъединитьПути("src", "cf");
КонецФункции

Функция ПутьКонфигурацииПоставщика()
	Возврат ОбъединитьПути("Ext", "ParentConfigurations");
КонецФункции

Лог = ПараметрыПриложения.Лог();
