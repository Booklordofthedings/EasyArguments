using System;
using System.Collections;

	/*
	-Easy Arguments-
	A simple argument organizer made by: Booklordofthedings(Jannis von Hagen)
	v.1.0
	
	Guide:
		Call FormatArgs with the arguments from main
		the object now contains a command member that has the intial command (if no intial command was given it will return "run")
		GetValueType will return the corresponding type to the key that you supplied
	*/

	class Arguments
	{
		public String command;
		private Dictionary<String,String> arguments;
		private static bool isInit = false;
		private this(String com)
		{
			command = com;
		}
				

		public static Arguments FormatArgs(String[] args)
		{
			if(args.IsEmpty)
			{
				return new Arguments("run");
			}
			int count = 0;
			Arguments output = new Arguments("run");

			for(int i = 0;i < args.Count;i++)
			{
				args[i].ToLower();
				if(!args[i].StartsWith("--") && output.command != "run")
				{
					output.command = args[i];
				}

				if(	!(i+1 < args.Count) &&
					!args[i+1].StartsWith("--"))
				{
					output.arguments.Add(args[i],args[i+1]);
					i++;
				}
			}
			isInit = true;
			return output;
		}

		///Get any Value from a String
		public Result<void> GetValue(String Key, String output)
		{
			Result<void> sucess = .Err;
			if(isInit && this.arguments.ContainsKey(Key))
			{
				sucess.ReturnValueDiscarded();
				output.Set(new String(this.arguments[Key]));
				sucess = .Ok;
			}
			return sucess;
		}

		///Get a value from a key as a String
		public Result<void> GetString(String Key, String output)
		{
			Result<void> sucess = .Err;
			if(isInit && this.arguments.ContainsKey(Key))
			{
				sucess.ReturnValueDiscarded();
				output.Set(new String(this.arguments[Key]));
				sucess = .Ok;
			}
			return sucess;
		}

		///Get a value from a key as a Float
		public Result<float> GetFloat(String Key)
		{
			Result<float> sucess = .Err;
			if(isInit && arguments.ContainsKey(Key))
			{
				sucess.ReturnValueDiscarded();
				String val = scope String(arguments[Key]);
				if(float.Parse(val) case .Ok(float output))
					sucess = .Ok(output);
			}
			return sucess;
		}

		///Get a value from a key as a Int
		public Result<int> GetInt(String Key)
		{
			Result<int> sucess = .Err;
			if(isInit && arguments.ContainsKey(Key))
			{
				sucess.ReturnValueDiscarded();
				String val = scope String(arguments[Key]);
				if(int.Parse(val) case .Ok(int output))
					sucess = .Ok(output);
			}
			return sucess;
		}

		///Get a value from a key as a Bool
		public Result<bool> GetBool(String Key)
		{
			Result<bool> sucess = .Err;
			if(isInit && arguments.ContainsKey(Key))
			{
				sucess.ReturnValueDiscarded();
				String val = scope String(arguments[Key]);
				if(bool.Parse(val) case .Ok(bool output))
					sucess = .Ok(output);
			}
			return sucess;
		}
	}

