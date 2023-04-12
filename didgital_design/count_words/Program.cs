using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;



namespace CountWords
{
    class Program
    {
        static void Main(string[] args)
        {
            string inputTxt = "C:/Users/valentina/source/repos/count_words/files/book.fb2";
            string outputTxt = "C:/Users/valentina/source/repos/count_words/files/output.txt";
 
            Dictionary<string, int> words = new Dictionary<string, int>();
            Regex regex = new Regex(@"\b[a-zа-яё'-]+\b", RegexOptions.IgnoreCase);

            using (StreamReader sr = new StreamReader(inputTxt))
            {
                string line;

                while ((line = sr.ReadLine()) != null)
                {
                    foreach (Match match in regex.Matches(line))
                    {
                        string word = match.Value.ToLower();

                        if (words.ContainsKey(word))
                            words[word]++;
                        else
                            words[word] = 1;
                    }
                }
            }


            using (StreamWriter sw = new StreamWriter(outputTxt))
            {
                sw.WriteLine($"Всего уникальных слов: {words.Count}\n");

                foreach (var item in words.OrderByDescending(k => k.Value))
                {
                    sw.WriteLine($"{item.Key}\t{item.Value}");
                }
            }
        }
    }
}
 