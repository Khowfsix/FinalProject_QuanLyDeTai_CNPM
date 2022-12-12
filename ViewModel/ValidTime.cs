﻿using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.ComponentModel.DataAnnotations;
using System.Globalization;
using System.Linq;
using System.Web;

namespace QuanLyDeTai.ViewModel
{
    public class ValidTime : ValidationAttribute
    {
        public override bool IsValid(object value)
        {
            DateTime dateTime;
            var isValid = DateTime.TryParseExact(Convert.ToString(value),
                                                "HH:mm:ss",
                                                CultureInfo.CurrentCulture,
                                                DateTimeStyles.None,
                                                out dateTime);
            return isValid;
        }
    }
}