import 'dart:convert';

SingnUpModel singnUpModelFromJson(String str) =>
    SingnUpModel.fromJson(json.decode(str));

String singnUpModelToJson(SingnUpModel data) => json.encode(data.toJson());

class SingnUpModel {
  final String email;
  final bool enteringEmailTwice;
  final dynamic confirmEmail;
  final bool usernamesEnabled;
  final dynamic username;
  final bool checkUsernameAvailabilityEnabled;
  final String password;
  final String confirmPassword;
  final bool genderEnabled;
  final String gender;
  final bool firstNameEnabled;
  final String firstName;
  final bool firstNameRequired;
  final bool lastNameEnabled;
  final String lastName;
  final bool lastNameRequired;
  final bool dateOfBirthEnabled;
  final dynamic dateOfBirthDay;
  final dynamic dateOfBirthMonth;
  final dynamic dateOfBirthYear;
  final bool dateOfBirthRequired;
  final bool companyEnabled;
  final bool companyRequired;
  final dynamic company;
  final bool streetAddressEnabled;
  final bool streetAddressRequired;
  final dynamic streetAddress;
  final bool streetAddress2Enabled;
  final bool streetAddress2Required;
  final dynamic streetAddress2;
  final bool zipPostalCodeEnabled;
  final bool zipPostalCodeRequired;
  final dynamic zipPostalCode;
  final bool cityEnabled;
  final bool cityRequired;
  final dynamic city;
  final bool countyEnabled;
  final bool countyRequired;
  final dynamic county;
  final bool countryEnabled;
  final bool countryRequired;
  final int countryId;
  final List<dynamic> availableCountries;
  final bool stateProvinceEnabled;
  final bool stateProvinceRequired;
  final int stateProvinceId;
  final List<dynamic> availableStates;
  final bool phoneEnabled;
  final bool phoneRequired;
  final String phone;
  final bool faxEnabled;
  final bool faxRequired;
  final dynamic fax;
  final bool newsletterEnabled;
  final bool newsletter;
  final bool acceptPrivacyPolicyEnabled;
  final bool acceptPrivacyPolicyPopup;
  final dynamic timeZoneId;
  final bool allowCustomersToSetTimeZone;
  final List<AvailableTimeZone> availableTimeZones;
  final dynamic vatNumber;
  final bool displayVatNumber;
  final bool honeypotEnabled;
  final bool displayCaptcha;
  final List<dynamic> customerAttributes;
  final List<dynamic> gdprConsents;
  final CustomProperties customProperties;

  SingnUpModel({
    required this.email,
    required this.enteringEmailTwice,
    this.confirmEmail,
    required this.usernamesEnabled,
    this.username,
    required this.checkUsernameAvailabilityEnabled,
    required this.password,
    required this.confirmPassword,
    required this.genderEnabled,
    required this.gender,
    required this.firstNameEnabled,
    required this.firstName,
    required this.firstNameRequired,
    required this.lastNameEnabled,
    required this.lastName,
    required this.lastNameRequired,
    required this.dateOfBirthEnabled,
    this.dateOfBirthDay,
    this.dateOfBirthMonth,
    this.dateOfBirthYear,
    required this.dateOfBirthRequired,
    required this.companyEnabled,
    required this.companyRequired,
    this.company,
    required this.streetAddressEnabled,
    required this.streetAddressRequired,
    this.streetAddress,
    required this.streetAddress2Enabled,
    required this.streetAddress2Required,
    this.streetAddress2,
    required this.zipPostalCodeEnabled,
    required this.zipPostalCodeRequired,
    this.zipPostalCode,
    required this.cityEnabled,
    required this.cityRequired,
    this.city,
    required this.countyEnabled,
    required this.countyRequired,
    this.county,
    required this.countryEnabled,
    required this.countryRequired,
    required this.countryId,
    required this.availableCountries,
    required this.stateProvinceEnabled,
    required this.stateProvinceRequired,
    required this.stateProvinceId,
    required this.availableStates,
    required this.phoneEnabled,
    required this.phoneRequired,
    required this.phone,
    required this.faxEnabled,
    required this.faxRequired,
    this.fax,
    required this.newsletterEnabled,
    required this.newsletter,
    required this.acceptPrivacyPolicyEnabled,
    required this.acceptPrivacyPolicyPopup,
    this.timeZoneId,
    required this.allowCustomersToSetTimeZone,
    required this.availableTimeZones,
    this.vatNumber,
    required this.displayVatNumber,
    required this.honeypotEnabled,
    required this.displayCaptcha,
    required this.customerAttributes,
    required this.gdprConsents,
    required this.customProperties,
  });

  factory SingnUpModel.fromJson(Map<String, dynamic> json) => SingnUpModel(
        email: json["Email"],
        enteringEmailTwice: json["EnteringEmailTwice"],
        confirmEmail: json["ConfirmEmail"],
        usernamesEnabled: json["UsernamesEnabled"],
        username: json["Username"],
        checkUsernameAvailabilityEnabled:
            json["CheckUsernameAvailabilityEnabled"],
        password: json["Password"],
        confirmPassword: json["ConfirmPassword"],
        genderEnabled: json["GenderEnabled"],
        gender: json["Gender"],
        firstNameEnabled: json["FirstNameEnabled"],
        firstName: json["FirstName"],
        firstNameRequired: json["FirstNameRequired"],
        lastNameEnabled: json["LastNameEnabled"],
        lastName: json["LastName"],
        lastNameRequired: json["LastNameRequired"],
        dateOfBirthEnabled: json["DateOfBirthEnabled"],
        dateOfBirthDay: json["DateOfBirthDay"],
        dateOfBirthMonth: json["DateOfBirthMonth"],
        dateOfBirthYear: json["DateOfBirthYear"],
        dateOfBirthRequired: json["DateOfBirthRequired"],
        companyEnabled: json["CompanyEnabled"],
        companyRequired: json["CompanyRequired"],
        company: json["Company"],
        streetAddressEnabled: json["StreetAddressEnabled"],
        streetAddressRequired: json["StreetAddressRequired"],
        streetAddress: json["StreetAddress"],
        streetAddress2Enabled: json["StreetAddress2Enabled"],
        streetAddress2Required: json["StreetAddress2Required"],
        streetAddress2: json["StreetAddress2"],
        zipPostalCodeEnabled: json["ZipPostalCodeEnabled"],
        zipPostalCodeRequired: json["ZipPostalCodeRequired"],
        zipPostalCode: json["ZipPostalCode"],
        cityEnabled: json["CityEnabled"],
        cityRequired: json["CityRequired"],
        city: json["City"],
        countyEnabled: json["CountyEnabled"],
        countyRequired: json["CountyRequired"],
        county: json["County"],
        countryEnabled: json["CountryEnabled"],
        countryRequired: json["CountryRequired"],
        countryId: json["CountryId"],
        availableCountries:
            List<dynamic>.from(json["AvailableCountries"].map((x) => x)),
        stateProvinceEnabled: json["StateProvinceEnabled"],
        stateProvinceRequired: json["StateProvinceRequired"],
        stateProvinceId: json["StateProvinceId"],
        availableStates:
            List<dynamic>.from(json["AvailableStates"].map((x) => x)),
        phoneEnabled: json["PhoneEnabled"],
        phoneRequired: json["PhoneRequired"],
        phone: json["Phone"],
        faxEnabled: json["FaxEnabled"],
        faxRequired: json["FaxRequired"],
        fax: json["Fax"],
        newsletterEnabled: json["NewsletterEnabled"],
        newsletter: json["Newsletter"],
        acceptPrivacyPolicyEnabled: json["AcceptPrivacyPolicyEnabled"],
        acceptPrivacyPolicyPopup: json["AcceptPrivacyPolicyPopup"],
        timeZoneId: json["TimeZoneId"],
        allowCustomersToSetTimeZone: json["AllowCustomersToSetTimeZone"],
        availableTimeZones: List<AvailableTimeZone>.from(
            json["AvailableTimeZones"]
                .map((x) => AvailableTimeZone.fromJson(x))),
        vatNumber: json["VatNumber"],
        displayVatNumber: json["DisplayVatNumber"],
        honeypotEnabled: json["HoneypotEnabled"],
        displayCaptcha: json["DisplayCaptcha"],
        customerAttributes:
            List<dynamic>.from(json["CustomerAttributes"].map((x) => x)),
        gdprConsents: List<dynamic>.from(json["GdprConsents"].map((x) => x)),
        customProperties: CustomProperties.fromJson(json["CustomProperties"]),
      );

  Map<String, dynamic> toJson() => {
        "Email": email,
        "EnteringEmailTwice": enteringEmailTwice,
        "ConfirmEmail": confirmEmail,
        "UsernamesEnabled": usernamesEnabled,
        "Username": username,
        "CheckUsernameAvailabilityEnabled": checkUsernameAvailabilityEnabled,
        "Password": password,
        "ConfirmPassword": confirmPassword,
        "GenderEnabled": genderEnabled,
        "Gender": gender,
        "FirstNameEnabled": firstNameEnabled,
        "FirstName": firstName,
        "FirstNameRequired": firstNameRequired,
        "LastNameEnabled": lastNameEnabled,
        "LastName": lastName,
        "LastNameRequired": lastNameRequired,
        "DateOfBirthEnabled": dateOfBirthEnabled,
        "DateOfBirthDay": dateOfBirthDay,
        "DateOfBirthMonth": dateOfBirthMonth,
        "DateOfBirthYear": dateOfBirthYear,
        "DateOfBirthRequired": dateOfBirthRequired,
        "CompanyEnabled": companyEnabled,
        "CompanyRequired": companyRequired,
        "Company": company,
        "StreetAddressEnabled": streetAddressEnabled,
        "StreetAddressRequired": streetAddressRequired,
        "StreetAddress": streetAddress,
        "StreetAddress2Enabled": streetAddress2Enabled,
        "StreetAddress2Required": streetAddress2Required,
        "StreetAddress2": streetAddress2,
        "ZipPostalCodeEnabled": zipPostalCodeEnabled,
        "ZipPostalCodeRequired": zipPostalCodeRequired,
        "ZipPostalCode": zipPostalCode,
        "CityEnabled": cityEnabled,
        "CityRequired": cityRequired,
        "City": city,
        "CountyEnabled": countyEnabled,
        "CountyRequired": countyRequired,
        "County": county,
        "CountryEnabled": countryEnabled,
        "CountryRequired": countryRequired,
        "CountryId": countryId,
        "AvailableCountries":
            List<dynamic>.from(availableCountries.map((x) => x)),
        "StateProvinceEnabled": stateProvinceEnabled,
        "StateProvinceRequired": stateProvinceRequired,
        "StateProvinceId": stateProvinceId,
        "AvailableStates": List<dynamic>.from(availableStates.map((x) => x)),
        "PhoneEnabled": phoneEnabled,
        "PhoneRequired": phoneRequired,
        "Phone": phone,
        "FaxEnabled": faxEnabled,
        "FaxRequired": faxRequired,
        "Fax": fax,
        "NewsletterEnabled": newsletterEnabled,
        "Newsletter": newsletter,
        "AcceptPrivacyPolicyEnabled": acceptPrivacyPolicyEnabled,
        "AcceptPrivacyPolicyPopup": acceptPrivacyPolicyPopup,
        "TimeZoneId": timeZoneId,
        "AllowCustomersToSetTimeZone": allowCustomersToSetTimeZone,
        "AvailableTimeZones":
            List<dynamic>.from(availableTimeZones.map((x) => x.toJson())),
        "VatNumber": vatNumber,
        "DisplayVatNumber": displayVatNumber,
        "HoneypotEnabled": honeypotEnabled,
        "DisplayCaptcha": displayCaptcha,
        "CustomerAttributes":
            List<dynamic>.from(customerAttributes.map((x) => x)),
        "GdprConsents": List<dynamic>.from(gdprConsents.map((x) => x)),
        "CustomProperties": customProperties.toJson(),
      };
}

class AvailableTimeZone {
  final bool disabled;
  final dynamic group;
  final bool selected;
  final String text;
  final String value;

  AvailableTimeZone({
    required this.disabled,
    this.group,
    required this.selected,
    required this.text,
    required this.value,
  });

  factory AvailableTimeZone.fromJson(Map<String, dynamic> json) =>
      AvailableTimeZone(
        disabled: json["Disabled"],
        group: json["Group"],
        selected: json["Selected"],
        text: json["Text"],
        value: json["Value"],
      );

  Map<String, dynamic> toJson() => {
        "Disabled": disabled,
        "Group": group,
        "Selected": selected,
        "Text": text,
        "Value": value,
      };
}

class CustomProperties {
  CustomProperties();

  factory CustomProperties.fromJson(Map<String, dynamic> json) =>
      CustomProperties();

  Map<String, dynamic> toJson() => {};
}
