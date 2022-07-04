# Terraform Modules

- A Terraform module is a set of Terraform configuration files in a single directory. Even a simple configuration consisting of a single directory with one or more `.tf`
 files is a module. When you run Terraform commands directly from such a directory, it is considered the **root module.**

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/02c890c2-3b22-400a-b020-89376d1d89fd/Untitled.png)

- Terraform only uses the config files in the directory called
- Module blocks can be used to call modules in other directories, loading the module’s config files
- Can be either local or remote

## Module best practices
- In many ways, Terraform modules are similar to the concepts of libraries, packages, or modules found in most programming languages, and provide many of the same benefits. Just like almost any non-trivial computer program, real-world Terraform configurations should almost always use modules to provide the benefits mentioned above.

The following are recommendations from Hashicorp:

- Name your provider terraform-<PROVIDER>-<NAME>. You must follow this convention in order to publish to the Terraform Cloud or Terraform Enterprise module registries.

- Start writing your configuration with modules in mind. Even for modestly complex Terraform configurations managed by a single person, you'll find the benefits of using modules outweigh the time it takes to use them properly.

- Use local modules to organize and encapsulate your code. Even if you aren't using or publishing remote modules, organizing your configuration in terms of modules from the beginning will significantly reduce the burden of maintaining and updating your configuration as your infrastructure grows in complexity.

- Use the public Terraform Registry to find useful modules. This way you can more quickly and confidently implement your configuration by relying on the work of others to implement common infrastructure scenarios.

- Publish and share modules with your team. Most infrastructure is managed by a team of people, and modules are important way that teams can work together to create and maintain infrastructure. As mentioned earlier, you can publish modules either publicly or privately. We will see how to do this in a future tutorial in this series.