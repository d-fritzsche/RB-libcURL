#tag Class
Protected Class cURLException
Inherits RuntimeException
	#tag Method, Flags = &h1000
		Sub Constructor(ErrantItem As ErrorHandler)
		  Me.ErrorNumber = ErrantItem.LastError
		  Select Case True
		  Case Not libcURL.IsAvailable
		    Me.Message = "libcURL is not available or is an unsupported version."
		    
		  Case Me.ErrorNumber = libcURL.Errors.INIT_FAILED
		    Me.Message = "Unknown failure while constructing a libcURL handle."
		    
		  Case Me.ErrorNumber = libcURL.Errors.ALREADY_ADDED
		    Me.Message = "The easy handle is already associated with a multi handle."
		    
		  Case ErrantItem IsA libcURL.cURLShare
		    Me.Message = libcURL.FormatShareError(Me.ErrorNumber)
		    
		  Case ErrantItem IsA libcURL.cURLMulti
		    Me.Message = libcURL.FormatMultiError(Me.ErrorNumber)
		    
		  Else
		    Me.Message = libcURL.FormatError(Me.ErrorNumber)
		    
		  End Select
		End Sub
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="ErrorNumber"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="RuntimeException"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Message"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="RuntimeException"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
