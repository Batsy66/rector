#Использовать logos

Перем ЛогПриложения;
Перем КаталогПроекта;


Процедура Инициализация()
	
КонецПроцедуры

Функция КаталогПроекта() Экспорт
	Рез = КаталогПроекта;
	Если Не ЗначениеЗаполнено(КаталогПроекта) Тогда
		ТекущийКаталог =  ТекущийСценарий().Каталог;
		Рез = ОбъединитьПути(ТекущийСценарий(), ТекущийКаталог, "../..");
		Файл = Новый Файл(Рез);
		Рез = Файл.ПолноеИмя;
		ЛогПриложения.Отладка("Каталог проекта: " + Рез);	
		КаталогПроекта = Рез;
	КонецЕсли;
	Возврат Рез;
КонецФункции

Функция ИмяФайлаНастройкиПакетнойСинхронизации() Экспорт
	Возврат "prepare.json";
КонецФункции

Функция КаталогЭкспорта() Экспорт
	Возврат "export";
КонецФункции

Функция КаталогВременныхФайлов() Экспорт
	Возврат "tmp";
КонецФункции

Функция ПутьИсходныФайлов() Экспорт
	Возврат ОбъединитьПути("src", "cf");
КонецФункции

Функция СтруктураПараметровПриложения() Экспорт
	
	Параметры = Новый Структура();
	Параметры.Вставить("ПутьХранилища" , "");
	Параметры.Вставить("ПользовательХранилища" , "");
	Параметры.Вставить("ПарольПользователяХранилища" , "");
	Параметры.Вставить("КаталогЭкспорта" , "");
	Параметры.Вставить("КаталогВременныхФайлов" , "");
	
	Возврат Параметры; 
КонецФункции

// Получить объект логирования. Кешируется
//
//  Возвращаемое значение:
//   Лог - объект Лог для приложения
//
Функция Лог() Экспорт
	Если ЛогПриложения = Неопределено Тогда
		ЛогПриложения = Логирование.ПолучитьЛог(ИмяЛогаПриложения());
		ЛогПриложения.УстановитьУровень(УровниЛога.Информация);
	КонецЕсли;

	Возврат ЛогПриложения;	
КонецФункции

Функция ИмяЛогаПриложения() Экспорт
	Возврат "oscript.app." + ИмяПриложения();
КонецФункции

Функция ИмяПриложения() Экспорт

	Возврат "prepare-base";
		
КонецФункции

Функция Версия() Экспорт
	
	Возврат "0.0.1";
			
КонецФункции

Функция Имя1С()
	Возврат "1c";
КонецФункции

Функция ПочтовыйЯщик1С()
	Возврат "1c@1c.ru";
КонецФункции

