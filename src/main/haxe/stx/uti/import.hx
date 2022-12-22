package stx.uti;

#if macro
  import haxe.macro.Type;
  import haxe.macro.Expr;
  import haxe.macro.Context;
  import haxe.macro.Compiler;
#end
using stx.Pico;
using stx.Nano;

using stx.uti.Logging;
using stx.Uti;


import haxe.rtti.CType.Path as CPath;
import haxe.rtti.CType.Platforms as CPlatforms;
import haxe.rtti.CType.FunctionArgument as CFunctionArgument;
import haxe.rtti.CType.CType as CType; 
import haxe.rtti.CType.PathParams as CPathParams;
import haxe.rtti.CType.TypeParams as CTypeParams;
import haxe.rtti.CType.Rights as CRights;
import haxe.rtti.CType.MetaData as CMetaData;
import haxe.rtti.CType.ClassField as CClassField;
import haxe.rtti.CType.TypeInfos as CTypeInfos;
import haxe.rtti.CType.Classdef as CClassdef;
import haxe.rtti.CType.EnumField as CEnumField;
import haxe.rtti.CType.Enumdef as CEnumdef;
import haxe.rtti.CType.Typedef as CTypedef;
import haxe.rtti.CType.Abstractdef as CAbstractdef;
import haxe.rtti.CType.TypeTree as CTypeTree;
import haxe.rtti.CType.TypeRoot as CTypeRoot;
 