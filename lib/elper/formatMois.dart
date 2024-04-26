

formatMois(String mois){
  String moisTampo="";
  switch (mois){
    case '01' || "1":
      moisTampo="Janvier";
      break;
    case '02'|| "2":
      moisTampo="Fevrier";
      break;
    case '03'|| "3":
      moisTampo="Mars";
      break;
    case '04'|| "4":
      moisTampo="Avril";
      break;
    case '05'|| "5":
      moisTampo="Mai";
      break;
    case '06'|| "6":
      moisTampo="Juin";
      break;
    case '07'|| "7":
      moisTampo="Juillet";
      break;
    case '08'|| "8":
      moisTampo="Août";
      break;
    case '09'|| "9":
      moisTampo="Septembre";
      break;
    case '10':
      moisTampo="Octobre";
      break;
    case '11':
      moisTampo="Novembre";
      break;
    case '12':
      moisTampo="Décemebre";
      break;

  }
  return moisTampo;

}

formatMoisInverse(String mois){
  String moisTampo="";
  switch (mois){
    case 'Janvier':
      moisTampo="01";
      break;
    case 'Fevrier':
      moisTampo="02";
      break;
    case 'Mars':
      moisTampo="03";
      break;
    case 'Avril':
      moisTampo="04";
      break;
    case 'Mai':
      moisTampo="05";
      break;
    case 'Juin':
      moisTampo="06";
      break;
    case 'Juillet':
      moisTampo="07";
      break;
    case 'Août':
      moisTampo="08";
      break;
    case 'Septembre':
      moisTampo="09";
      break;
    case 'Octobre':
      moisTampo="10";
      break;
    case 'Novembre':
      moisTampo="11";
      break;
    case 'Décemebre':
      moisTampo="12";
      break;

  }
  return moisTampo;

}